Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82832346AD5;
	Wed, 25 Feb 2026 11:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772019123; cv=none; b=VkG9Nx7y6jpyQ8jHEwljVXEXziJzxRHD2JIMRqgEQ3tXCFGJhVcjZTlKKDK40Y64oFoAnrmPhfzvcNwxxZThgHMPlody4DfxDbFaP4RuH7ERhQhcXB8JiVl9u/rUfpQQm2CnibJk/u3ZneGvVGX2AHWAdQfWgT5AmY24MG/BJFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772019123; c=relaxed/simple;
	bh=R2R2eDsHNuLYonyIEqSGhS8TL0yxK8Vj+BchHJl6enM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=D0K/+tEiJYH9VtQGLn3Ov1rBKHQex3DFM+zrLqhNAljHu2RKREhN2oH0/fkZe6pkfIcD2NNomPi7EWseYNkN7Cdw8RtJRLhBbsV84617flS/odau4kHNbPgru79wb9dA9HGyAfcwm2WZYrYiOLBKP2uyrkW92NRxNCwC5MHR2uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emLrXzOz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emLrXzOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F2CC116D0;
	Wed, 25 Feb 2026 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772019122;
	bh=R2R2eDsHNuLYonyIEqSGhS8TL0yxK8Vj+BchHJl6enM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=emLrXzOzIHkj73jPXqP5z/ClWb4ngKCuVpLtI/zq3qecEphzbfOh3OOO9tPizFNOD
	 v5hjw5WiL+lRsFyWr8UI74e19Q4P7zNBfUowrrznunrbREFRW8V/XhsauGtG/y7QbG
	 G8yxXXqAFVObQ56jwLIAOIsyxDYP25smMBr9GqcqkoboMLHRpqFhQMFbmrGfXmjKam
	 p8FX8/hXnBxJ3ojQs2jFA98XxohlcZRHPOuJIf0ZQyZn+0KAqcdKpZ/pj5PeXE/7XG
	 KYyO5YSMmtSOYknhvBcTww1ejLRGmbmdCSW5h+NiCtT4m/NZqQtGL/fZ3o/WJKsRes
	 MQW0bdPG0+6Bg==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 12:31:57 +0100
Message-Id: <DGO0COF2NCJ0.GFYKM4L9KTP0@kernel.org>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Cc: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <daniel.baluta@oss.nxp.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>, <Frank.Li@nxp.com>,
 <s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <festevam@gmail.com>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>
To: "Peng Fan" <peng.fan@oss.nxp.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260212235842.85934-1-dakr@kernel.org>
 <aZ6vyQw5a5LhSCaT@shlinux89>
In-Reply-To: <aZ6vyQw5a5LhSCaT@shlinux89>

On Wed Feb 25, 2026 at 9:16 AM CET, Peng Fan wrote:
>>diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.=
c
>>index 3ae162625bb1..c781425a005e 100644
>>--- a/drivers/clk/imx/clk-imx8qxp.c
>>+++ b/drivers/clk/imx/clk-imx8qxp.c
>>@@ -346,7 +346,29 @@ static struct platform_driver imx8qxp_clk_driver =3D=
 {
>> 	},
>> 	.probe =3D imx8qxp_clk_probe,
>> };
>>-module_platform_driver(imx8qxp_clk_driver);
>>+
>>+static int __init imx8qxp_clk_init(void)
>>+{
>>+	int ret;
>>+
>>+	ret =3D platform_driver_register(&imx8qxp_clk_driver);
>>+	if (ret)
>>+		return ret;
>>+
>>+	ret =3D imx_clk_scu_module_init();
>>+	if (ret)
>>+		platform_driver_unregister(&imx8qxp_clk_driver);
>>+
>>+	return ret;
>>+}
>>+module_init(imx8qxp_clk_init);
>>+
>>+static void __exit imx8qxp_clk_exit(void)
>>+{
>>+	imx_clk_scu_module_exit();
>>+	platform_driver_unregister(&imx8qxp_clk_driver);
>>+}
>>+module_exit(imx8qxp_clk_exit);
>
> The clk driver is critical for the system to work, removing this driver w=
ill
> make the system not work properly I think, so it may not make too much
> value to add an exit function here.

The exit function was there before, just hidden by the module_platform_driv=
er()
macro.

If a driver can be built as module, then we have to unregister the driver, =
when
the module is unloaded.

If this driver should always be builtin, that is a separate change, indepen=
dent
from this fix.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93998224D6;
	Thu, 12 Feb 2026 17:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770916962; cv=none; b=M9nD/8XLYL9NydwZ1pp96KtsJA/EhG4NbiosZbIPvv38Sy0nX5oUbqQcUiUqGdd9nCtpe8pRQ1Sk9AloopUMFzFqZRpt32mdAxmkfFurTcsrSFoRSgWSGrg6HozHPcMjT9rp/1+fLX4NQhUW3ivejNeBzke5U2ZM/Oi9bNHQQok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770916962; c=relaxed/simple;
	bh=iJ0YRwN6PPvgdP4k/lovtQlvdW0CLzt86NfrNxQIu/8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=WLRqaFVoaYg61kfKZe8jzBTUh+WXEu2lY89eanAs4Tob+uzEu7/gh9UBGXNYZVBcGRInVYbEI/XcyQuYdsZeYlC1NhUSp4r81n8Qn89xLybxgccxdL7/rz9OpJPw9yxd0LeGkIGuVKXyDy6tBR8IYGYm3Y1rz8BpZH45MtzdmnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkZ5cBQ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkZ5cBQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E756DC4CEF7;
	Thu, 12 Feb 2026 17:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770916962;
	bh=iJ0YRwN6PPvgdP4k/lovtQlvdW0CLzt86NfrNxQIu/8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ZkZ5cBQ3hyW23ADEtMnxvnYidWMgFpWd/qpO4NBEQdkN/Fpd4BTZTfxQFKmpv8xlU
	 lGN9WpLvgHpEyjuBBzuAd6U4x2dxvYoIH6QExSSRqEEcudovh5/wclWwTnXRlA32PE
	 7h73aXZBYBCzG4rQAiLn+wlAz7dN4fFuXr96aTjd85kPcscNzOdu0ZsaVhjdUiiw/3
	 yK3LxPopF9GJOtUefQ3gncnS1MiJXaCtvWTL7qn3Za5PkNWIJ1GhryEMSv7Y6ExMA0
	 Z/OwNJkIKqPbIYDN1IB3figktfMLyu2siT9IHPPZ2NBRGRgFMWZ7PzK/50QIJtzbuH
	 sYMLCC3h42Zxw==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 18:22:37 +0100
Message-Id: <DGD5O31G6G9X.R8G6EBXXFKAH@kernel.org>
Subject: Re: [PATCH] clk: scu/imx8qxp: do not register driver in probe()
Cc: "Alexander Stein" <alexander.stein@ew.tq-group.com>,
 <abelvesa@kernel.org>, <peng.fan@nxp.com>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>, <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
To: "Daniel Baluta" <daniel.baluta@oss.nxp.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260211142321.55404-1-dakr@kernel.org>
 <10809444.nUPlyArG6x@steina-w>
 <9e33e5e5-76cd-4395-acb4-e2e03e436bf5@oss.nxp.com>
In-Reply-To: <9e33e5e5-76cd-4395-acb4-e2e03e436bf5@oss.nxp.com>

On Wed Feb 11, 2026 at 3:59 PM CET, Daniel Baluta wrote:
> On 2/11/26 16:43, Alexander Stein wrote:
>> Am Mittwoch, 11. Februar 2026, 15:23:16 CET schrieb Danilo Krummrich:
>>> +{
>>> +	int ret;
>>> +
>>> +	ret =3D platform_driver_register(&imx8qxp_clk_driver);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret =3D imx_clk_scu_module_init();
>>> +	if (ret)
>>> +		platform_driver_unregister(&imx8qxp_clk_driver);
>>> +
>>> +	return ret;
>>>
> Also, because the logical flow is that CLK driver is uing SCU for calls I=
 would first call
> imx_clk_scu_module_init and then register the imx8qxp_clk driver.=20
>
> But there is no functionality issues your your approach too, just a bette=
r logical flow.

I now remember why I kept it this way around. If we swap it we have to call
imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
Consequently, we'd have to drop __exit from imx_clk_scu_module_exit().

Please let me know what you prefer.

Thanks,
Danilo

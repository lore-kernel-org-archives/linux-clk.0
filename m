Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64A0192B7D;
	Mon, 23 Feb 2026 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771878095; cv=none; b=OETgRGPtqn7BnoZM1G2g6CdZqKLqYl9UC3lLVMTUtLA29TDvlhAEYse1ky7+qjsiiFgtsbRHcu1JgRDXjKzbSEHZ9bHrCAkp+JJXCV24MXoxUFq+BzC5ZIOUFXb9KlhtyhK+vjserZ3b4lD7nzdU5CovtS72Rp170e4H70hfzWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771878095; c=relaxed/simple;
	bh=+Hpm57PQ6z66kTV3VzXaXYxWnyZULtnHD8/mYcKUJIg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dwBefT2QRv/3EzjIrSR7FVDGGXGIeH2Shixy3hC6GvF+x56EpYI1n/CIgeiY/mOaiaCuLH2fuGvTmmbzSUHAphzGAcTnt/UX5L5nFfv751wbQvy19rE7A70XlonpiklAvL++rwi6JAactCR89WhQyn0I9TjjN76YWnOZdFZ2UfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKqpdt9P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKqpdt9P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB62C116C6;
	Mon, 23 Feb 2026 20:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771878094;
	bh=+Hpm57PQ6z66kTV3VzXaXYxWnyZULtnHD8/mYcKUJIg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=TKqpdt9PHM4za72yOLzVtNwrZq5WJg2ASV3s6HMZ0oAmLepstc7UW+CAzK4CJSkuS
	 4vDMxhAiSEzVzQIFTYhbQ9CdREhpJ6KDgmCuiOEZHZK4bSwbWr9tlKEnMfUPyRQM4W
	 tH+P1HG1QUcTfvMYhBmICuPntIehwXtXIZ8U80osgKPN9GipQR/TUKvQr+qgH8VltC
	 oUk1kaL8Ay+grNYXrH5B8AT7TNUFw9xEUU0SK4meGBIumiw/c8u4R1+lToYRVb/j4/
	 hay6pn6QB0eXFPV4MxwfLw0GMEs97n6F5DBjH5BYPAEUOUMOUxuyBLTIfKli5wqHQQ
	 MRe1jukhUyB8g==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 21:21:29 +0100
Message-Id: <DGMMD195G9VX.245Z0JMIYO9HV@kernel.org>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, "Alexander Stein"
 <alexander.stein@ew.tq-group.com>
To: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <daniel.baluta@oss.nxp.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>, <Frank.Li@nxp.com>,
 <s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <festevam@gmail.com>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <hanguidong02@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260212235842.85934-1-dakr@kernel.org>
In-Reply-To: <20260212235842.85934-1-dakr@kernel.org>

On Fri Feb 13, 2026 at 12:58 AM CET, Danilo Krummrich wrote:
> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> called from IMX driver's probe() callbacks.
>
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
>
> The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> device_lock for driver_match_device()") leading to a deadlock condition
> described in [1].
>
> Besides that, nothing seems to unregister the imx_clk_scu_driver once
> the corresponding driver module is unloaded, which leaves the
> driver-core with a dangling pointer.
>
> Also, if there are multiple matching devices for the imx8qxp_clk_driver,
> imx8qxp_clk_probe() calls imx_clk_scu_init() multiple times.  However,
> any subsequent call after the first one will fail, since the driver-core
> does not allow to register the same struct platform_driver multiple
> times.
>
> Hence, register the imx_clk_scu_driver from module_init() and unregister
> it in module_exit().
>
> Note that we first register the imx8qxp_clk_driver and then call
> imx_clk_scu_module_init() to avoid having to call
> imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
>
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_d=
evice()")
> Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as mod=
ules")
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8x/MBa=
8x
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/=
 [1]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Just a quick reminder now that -rc1 is out; I think it would be good if thi=
s
could go to Linus for -rc2.

(Just in case it helps, please let me know if you want me to take it throug=
h the
driver-core tree for this purpose.)

Thanks,
Danilo

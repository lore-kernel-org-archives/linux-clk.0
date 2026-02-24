Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE6438B7C3;
	Tue, 24 Feb 2026 12:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771934695; cv=none; b=gbs0fbDDT4GAXWhB74vTsWIc3tvIpFAiELPkSlW8PLUrAzaI98EEHdk31VEYbGkKGTAp277hBeccqCE40yV0t+sYydcrDgXoeF1s1uMUOybYX4mLRLfqaLuY9ocYAsV8UQbn+T9TUeXsn9JA7mp7VPxOsJzBu5VzsKqYEYNhxYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771934695; c=relaxed/simple;
	bh=Qz9qdMX+vBbJV6Arts3WVnCOBY9g2cEaJRQR11r+cxw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=rPGL609MQXDN0aXTcZN9AWgsVANdCdAR5Yc+cb+/4qxEHHHvjRjaAKrVLzwYsjvvj7Np22kglT52hZ0LmoWfXpraE1j5/6II87Z+kXg0+u3S+yyrJ4T5JJ1roWC1oLh2W45/no2rkLinUt3prIHixTqczzapT1bAYx+dsD5jSi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZiR7Axq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZiR7Axq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBF3C19424;
	Tue, 24 Feb 2026 12:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771934695;
	bh=Qz9qdMX+vBbJV6Arts3WVnCOBY9g2cEaJRQR11r+cxw=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=lZiR7AxqIghjBpkiiGPbBNU5t/SUaLyeoB/0nQt2fSrl1Beg4CgujW9KAO47LRyGB
	 gRMEnoLvxX/Sk1/OmRxBRu9b9fjgMF0N/JReEMBg52nVnVgyZONl7bJM1LU0wpbtof
	 BUwAM3slBbS+Og0xUMNsx7hI6+TsNz83haBAjl5Nf2JGdoQuzPbHVpF27vtd94qnup
	 ByA+2P/nqhdUIiANEa/jqtWGbg1TTOlE3p2hWNf/tlxsHQczMXoaO6+iR93fHSN90J
	 Da3VCwvil8CKtBctvBhguUvplmPGEMPP2AOfgoxBdFtoGRQGvRx/PfQ5zfTRdZBBLj
	 Hs6tAA3QVwr/A==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 13:04:49 +0100
Message-Id: <DGN6FANOYD3K.AFFNS0QXPCQW@kernel.org>
Cc: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <daniel.baluta@oss.nxp.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>, <Frank.Li@nxp.com>,
 <s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <festevam@gmail.com>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
References: <20260212235842.85934-1-dakr@kernel.org>
 <DGMMD195G9VX.245Z0JMIYO9HV@kernel.org>
 <66i6cgh5zmz32ikwjvrz3gtezjotltqmfzdai7ybwjhanx3bif@i5g62ziautwq>
In-Reply-To: <66i6cgh5zmz32ikwjvrz3gtezjotltqmfzdai7ybwjhanx3bif@i5g62ziautwq>

On Tue Feb 24, 2026 at 10:57 AM CET, Abel Vesa wrote:
> On 26-02-23 21:21:29, Danilo Krummrich wrote:
>> On Fri Feb 13, 2026 at 12:58 AM CET, Danilo Krummrich wrote:
>> > imx_clk_scu_init() registers the imx_clk_scu_driver while commonly bei=
ng
>> > called from IMX driver's probe() callbacks.
>> >
>> > However, it neither makes sense to register drivers from probe()
>> > callbacks of other drivers, nor does the driver core allow registering
>> > drivers with a device lock already being held.
>> >
>> > The latter was revealed by commit dc23806a7c47 ("driver core: enforce
>> > device_lock for driver_match_device()") leading to a deadlock conditio=
n
>> > described in [1].
>> >
>> > Besides that, nothing seems to unregister the imx_clk_scu_driver once
>> > the corresponding driver module is unloaded, which leaves the
>> > driver-core with a dangling pointer.
>> >
>> > Also, if there are multiple matching devices for the imx8qxp_clk_drive=
r,
>> > imx8qxp_clk_probe() calls imx_clk_scu_init() multiple times.  However,
>> > any subsequent call after the first one will fail, since the driver-co=
re
>> > does not allow to register the same struct platform_driver multiple
>> > times.
>> >
>> > Hence, register the imx_clk_scu_driver from module_init() and unregist=
er
>> > it in module_exit().
>> >
>> > Note that we first register the imx8qxp_clk_driver and then call
>> > imx_clk_scu_module_init() to avoid having to call
>> > imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
>> >
>> > Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_matc=
h_device()")
>> > Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as =
modules")
>> > Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> > Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
>> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8x/=
MBa8x
>> > Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.o=
rg/ [1]
>> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> Acked-by: Abel Vesa <abelvesa@kernel.org>

Applied to driver-core-linus, thanks!

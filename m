Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3274AF9C2;
	Thu, 17 Sep 2026 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647245; cv=none; b=RNbAHMRt+4Fsk3GfowKJ/hfEcMadIRdfWpbE7U9QlkQSzXIv8nj/zgIuNaXIh+ZqonHRtcr+dsqMJbP3Au2RQoqtm/zHxLuJ0TvKMhNbw2gFNn67cGdbsWbzW5wEBRBg1xjAxq5qBWegsnrVPRahxHfgfVtNlWvDxh7yVFPRdzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647245; c=relaxed/simple;
	bh=5hK8h+7PZdM+x67ExthCqnQ1kxwWv4WPb1N8ye4jOh4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hdL8iYEcbJE6ELqufY2kQvXGQv5snPWVWKhW8EtWfmRr3k7Uy3Bk/Aeb6kFuWL75QTZN7MsctMbOLhfb+Eqpj+o+Dmqg+M6gQh5+og9yZGgGpzr2UhFapzRErcJGgmpai+0amuQLGoA3h5mOW1ytXLvKD0cvLpHkvxFt6n/Bdzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kn7sX8W4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kn7sX8W4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C60E1F00893;
	Thu, 17 Sep 2026 12:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789647228;
	bh=ozUZkmxin8NVkYJE33MziqIGT11+SkXO/49dIPN2sdo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kn7sX8W4sXToHa38LBDVMmbWxxARM/OzA+T9mFFuc91xLGeQiEYpOmZ2bAgaXvZwL
	 AjyPHY7p75gJQWKWjCfaVsoFKDXdJyB5oAG+w9NPto73Ckncjl2/eX0czDLOeH+Och
	 YzSLll5kfeb6UNOiNZUeWEgMWkm5afOPIPFMN5kd05hz3qRuE/TFXAJLhy9L97r/cW
	 XiEKwdNWcDnMZp7L9uAdEWAnPhht5gvJk85BrjWL+KbPl6pD8BLwMhLsp04CNThUiz
	 b37Yj47FmpHwsdaYsH5wMZlxivKGEM6liDvVtbQsafuNRGyPqIy/7DlHmELVHTeXq7
	 J9zQ99ZovcarA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/10] media: rcar-fcp: Handle resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Elder" <paul.elder+renesas@ideasonboard.com>
Cc: linux-clk@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-7-4c72d4e086dd@ideasonboard.com>
References: <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-0-4c72d4e086dd@ideasonboard.com>
 <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-7-4c72d4e086dd@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 12:13:47 +0000
Message-Id: <20260917121348.3C60E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: rcar-fcp: ignored reset_control_deassert() return value i=
n runtime PM
--

commit 35565c06b039b0484d84fa1dae3bc646e765ec43
Author: Paul Elder <paul.elder+renesas@ideasonboard.com>

media: rcar-fcp: Handle resets

On some versions of the FCP, such as the one on the X5H, reset control
is required to operate the FCP. Add support for handling resets
optionally, to continue supporting versions that do not require it.

> diff --git a/drivers/media/platform/renesas/rcar-fcp.c b/drivers/media/pl=
atform/renesas/rcar-fcp.c
> index d99b3ff976e80..15bcbbda3b853 100644
> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c
[ ... ]
> @@ -305,11 +314,32 @@ static void rcar_fcp_remove(struct platform_device =
*pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
> =20
> +static int fcp_pm_runtime_suspend(struct device *dev)
> +{
> +	struct rcar_fcp_device *fcp =3D dev_get_drvdata(dev);
> +
> +	reset_control_assert(fcp->rstc);
> +	return 0;
> +}

[Severity: Medium]
Is it safe to ignore the return value of reset_control_assert() in
fcp_pm_runtime_suspend()?

If the reset assertion fails, the error will be masked during suspend since
0 is always returned to the PM core.

> +
> +static int fcp_pm_runtime_resume(struct device *dev)
> +{
> +	struct rcar_fcp_device *fcp =3D dev_get_drvdata(dev);
> +
> +	reset_control_deassert(fcp->rstc);
> +	return 0;
> +}

[Severity: Medium]
Should the return value of reset_control_deassert() be checked and propagat=
ed
in fcp_pm_runtime_resume()?

If the deassertion fails during resume, the PM core and the driver will
wrongly assume the hardware is fully resumed. Subsequent register accesses
could target a device still in reset, which typically leads to invalid
data reads (0xffffffff) or bus faults.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-epaul-v7-3=
-rc1-x5h-vsp-fcp-v1-0-4c72d4e086dd@ideasonboard.com?part=3D7

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A4C260565;
	Sun, 27 Sep 2026 20:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542629; cv=none; b=bZNqqxCqggBqAdA/5R61hq+EbslVnii5ay2+vLCgrjNNscqPdRsuKwHvNDYYzLjhNe7rl/W2vg4/Wms3Emu3FdCJrwRg4Sktq+PfYUIx6n1MPGurs0Ko93DarzPvAqggcHCP6el+yqecJf/lnIzImTKsEBcM4d0PUlXtU4nC2L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542629; c=relaxed/simple;
	bh=6vR/WQ/e+xzVWDwf+aaaIWS+ur0WU/RIopDvISSHwOc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tZeze/k4k5HtiW94uqNG3iIOVy+QmdX0bIi/XPzH1w4RAIgZcSx+CZmgRznGsYVMRUuXu2NWCVwK/tJBGwivmQ3b1Le0mk4leUAN3jzTyMXFSxj/weUIHNDIF9vgrOD81Y1DeYCLpEA/SwOyc8oxkrgknMczNDa/1RTT78+Tw00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nX4l9jAK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nX4l9jAK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811151F000FF;
	Sun, 27 Sep 2026 20:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790542628;
	bh=6vR/WQ/e+xzVWDwf+aaaIWS+ur0WU/RIopDvISSHwOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nX4l9jAKKcsceqglOcODViLIBpK3M850NtMhyDN5KWtLCA/N05W//eqA5JIsVItiB
	 AkiGcFzPfxK1vwLdhiLyCWBArTo1ZPt93tJZby+ijxpjg84FSRh4WZsbZhR+PQ7a3d
	 KGPl4oSH1Wz5kDdfSWMuc6mPvX793Q1dflZNL2SNtclloyxokhLc3gV2uB6FlnEqNr
	 7KIEUqzVlk2ZjzxUDcd7ZAH2jznqZT3YLRnae1lgIOdsJU1CNVeYkRzmd8DPZagi46
	 bLBhiOWljtdw18jOGrmq0N3G4iEIEJNlHY+3PBgF1XCVFteWH3rCsoVcfRxwvq+w+T
	 8U99cDta6ptJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 04/13] mfd: zx297520v3: Add a clock and reset MFD
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: lee@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, olteanv@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260927-zx29clk-v13-4-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-4-70d8f673386c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 20:57:07 +0000
Message-Id: <20260927205707.811151F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This driver registers child devices for the zx297520v3 clock and reset
> controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
> the next patches will drive the respective functionalities.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-zx29clk-v1=
3-0-70d8f673386c@gmail.com?part=3D4


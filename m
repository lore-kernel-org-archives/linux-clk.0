Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5B5356772;
	Fri,  4 Sep 2026 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528713; cv=none; b=tu3V01YQ4OYIuK3Cv7RG5CGY8MOLKW67wHQdW3CyePMuR9e2czcOJGZ+hPA/JG/ap8G2I6N77vDAHYzeforFLRFTJGS4mdl73hpjxtZf1EHSgrVeMMODwTQCW/JsKQ3LpyKRFp48rER+yM5kw5IWpXIMvXLdPaiEpfcCYtXbXHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528713; c=relaxed/simple;
	bh=gM2+Na6lCEHQBMxk+PB55G0kVJNJHy+Up3YtZhB7FfQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NiaIfYwqyBjVnPN2vVAJ5MJmZ1YQ6Kmye9ECJZLnD6dPjpNRzrXkt+TYW9z07TS9MVWSy41+SdELIl/1OsSgEbky+bMmG4QhSP8ubBIOV7JAyMb8NR3oJIxNVUmrQ02l8e8UxbD40sicyM3xysZaE64Jb6MyW+Xg6715u6pWZFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmlrpCoX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmlrpCoX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154A51F00A3D;
	Fri,  4 Sep 2026 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788528711;
	bh=gM2+Na6lCEHQBMxk+PB55G0kVJNJHy+Up3YtZhB7FfQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bmlrpCoXqLyfkBbMFcVLNTLDLojXbQolAGXpeaZjpcj/Lw6WF2tJHCT2ZVpQ0mcGm
	 Ph7r+XSf2nTnCo7Tx4xb/zFqip8xSUTDcnZ+LCJSkMSxy0viPOXbgE2Q/THo2cmUjW
	 ssXQS9/8hZ2bAc673SQckYm52pVIgIPZ7CVLUAravXhQ6OqA7RaFcMiokbXMjkoxTa
	 GNeIJ5IhqS1sw6MFLK/AbHXSZN4kaPcDJh6C/k5Oe8BC+26MbU+79nLukASVfsLaCc
	 dv8Fu0SFVb94xGHjvCNsF7QH9ajiOuHi5s4mhbpQxv+ECpbscgOuTSg7aFZHrITo8G
	 pOhbEhS5J8wFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/19] dt-bindings: display: verisilicon: Add
 starfive,jh7110-dc8200
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: conor+dt@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, vkoul@kernel.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, dri-devel@lists.freedesktop.org
In-Reply-To: <20260904-jh7110-clean-send-v3-6-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132719eucas1p1c900149ffa1b8771aca238e6441482ee@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-6-484f9ae72715@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 13:31:50 +0000
Message-Id: <20260904133151.154A51F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> The JH7110 embeds a DC8200. The binding requires an SoC specific
> compatible ahead of the generic one, so add the JH7110 to the enum.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-jh7110-cle=
an-send-v3-0-484f9ae72715@samsung.com?part=3D6


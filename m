Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2233164BA
	for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791660881; cv=none; b=iNdgHVHMTTm+3HDyj9yx9CvtA+y7hsPWh+MCgFBagTkHj0zKlUaoTT6tcT9ftIAfc5ddPPNdj4oP4BoxosHNqqhVwCXg7IwopXcgy8e59mfsuwYh4MV5PkB2NkLhlbX5SU/5Ldv/nBmBT/T3Yu3PimVs+jef2pUPP4I7QNuJJ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791660881; c=relaxed/simple;
	bh=2jg4Zg9CY3g2Liw7gGHp2KJ5maqfxequAZ88NAf4gZk=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=FhKuIakxOLaBY+QkZ6ToVeDN1N9hWix5uba05SILrWLKCh7kKYutwa7ytbryaRxIDohzKQxd0G+a3j/Okw6U5xaeosyviKt0ynBWTg0gpuzI0R816gja2fIcyp9KJSbpaN/QZG8vz647CYh40c+PeSLoYLizrITOOnu6VqIGeMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=W5xvqxGb; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="W5xvqxGb"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 764831086F7;
	Sat, 10 Oct 2026 21:26:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1791660420;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2jg4Zg9CY3g2Liw7gGHp2KJ5maqfxequAZ88NAf4gZk=;
	b=W5xvqxGbc02BTI2TJnYlayEy/DAsWqTJ83UtPEWeM5UYLxqihTQXn2iEpPG2zhGWgMAV3H
	IQdkN20j5Dszlmpobk8g0huambde8vfpGuKuxGLQqCctVs3uV39iFX6IPROcaDtVaeYTH0
	CN3rjvR9gCJrcY6Mv+VR2N33LdP2XqzAgeC/6ZeFte5cl+pZVA/zp9UURgXRsrvK/kMb7S
	DbncncUXHRD/bex88cm4WDnBLAhq8/uRigLUIMidtADtcDG8hI1VFHRNnU0ZTegU5I0mfd
	0gNHpIl49zFj6UZefWVXm7HLu35flLcnNVboVE5r2iS6O0DbgU1EYhJBU0F5hQ==
From: "Fabio Estevam" <festevam@nabladev.com>
In-Reply-To: <1791641839-74584-3-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
References: <1791641839-74584-1-git-send-email-shawn.lin@rock-chips.com> <1791641839-74584-3-git-send-email-shawn.lin@rock-chips.com>
Date: Sat, 10 Oct 2026 21:26:58 +0200
Cc: "Stephen Boyd" <sboyd@kernel.org>, heiko@sntech.de, "Brian Masney" <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>, linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
To: "Shawn Lin" <shawn.lin@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <a44bfaca-9c4e-dc0c-6f83-364a7953bb44@nabladev.com>
Subject: =?utf-8?q?Re=3A?= [PATCH 2/2] =?utf-8?q?clk=3A?==?utf-8?q?_rockchip=3A?= 
 fix wrong PMU CLKSEL register on rv1103b
User-Agent: SOGoMail 5.12.11
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None

Hi Shawn,

On Saturday, October 10, 2026 11:17 -03, Shawn Lin <shawn.lin@rock-chip=
s.com> wrote:

> clk=5F32k and dbclk=5Fpmu=5Fgpio0 use RK3568=5FPMU=5FCLKSEL=5FCON(0),=
 which is the
> wrong SoC macro and resolves to 0x100 in the PERICRU region instead o=
f
> the RV1103B PMUCRU register at 0x70300. Reading or setting these cloc=
ks
> would access an unrelated register.
>=20
> Use RV1103B=5FPMUCLKSEL=5FCON(0), as already done for the XIN=5FRC=5F=
SRC clock
> in the same file.
>=20
> Fixes: 3e65e426d457 ("clk: rockchip: Add clock controller for the RV1=
103B")
> Cc: Fabio Estevam <festevam@nabladev.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

Thanks for the fix.

Reviewed-by: Fabio Estevam <festevam@gmail.com>


Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBD63B9DA2
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 20:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790714204; cv=none; b=uuf9YvzH3kPdYSZCkSIjiG33g+HPjN7jd3UYZ/DoGVpq3s79/bGcpEO3HR2txUDFjFYV2jmmzSnN7CI122/Xp72Ugf75mw2yoXyVAF1lQrholibxR9T7lv1exlEQi12q9OEYtqMZosSZFOS0Sedy/F2Vk9nwq/VUzv6Jdqy8ld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790714204; c=relaxed/simple;
	bh=yhpu5AzNOI5Y10YA5nFBH+Nkn7LBfLtKpgOknmId3pg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K8gQ1791KjwrZTDe+TaScyNa590nTp89PJhA+BicdUJ635xdm35Rfgzaqp8ujxyoUBPkAbZrAgH0TrIixLymf1oygWm3dmTBJeTqAxbMPpkzsg7WqXUj2qzJ0AIu1ROyozZ8by0Eq/7gScRhBX/zKkIV+3lLUE+Oxfjbtyu+m94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WAH/Mp+1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WAH/Mp+1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2F6871A1068;
	Tue, 29 Sep 2026 20:36:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7F47601BD;
	Tue, 29 Sep 2026 20:36:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8876B10329865;
	Tue, 29 Sep 2026 22:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790714198; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yhpu5AzNOI5Y10YA5nFBH+Nkn7LBfLtKpgOknmId3pg=;
	b=WAH/Mp+13aZ5eDr8kOEsC1v3Ok9ucToS9GnpiqyopQtL29j1sHMbGhqHPlXUaJBc8KihKl
	KSW3Q2eUAT9N8eEvvMKurcqFeUFtvkTd0lFqGSGlwReBdAC6GqfJjvkhT0e77v+Fs5FgGc
	sB6a4aPme+tBjZLoP5U6K28wdW1zbq2uFCMCte+Y2Iptg/sOkLtTjQ8hj/RGRwMtemj44u
	aZiWAaTDFXvFfsu4ATJOpFSHcIoIm4jAuHBqrnB9OVKWl5wDojJK2qkQkUWikm9SBRdP4a
	ePkus+vRyVlAVqxNuksxJKAqmuvZ1W97trLVnkMf0CgyVrl6U1uaB7HtImEOwA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  devicetree@vger.kernel.org,
  linux-clk@vger.kernel.org,  conor+dt@kernel.org,  robh@kernel.org
Subject: Re: [PATCH v5 8/9] clk: nuvoton: ma35d1: get HXT/LXT from DT
In-Reply-To: <20260929145618.187A21F000FF@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Tue, 29 Sep 2026 14:56:17
	+0000")
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
	<20260929-perso-ma35d1-upstream-clk-v5-8-68533e935ee4@bootlin.com>
	<20260929145618.187A21F000FF@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 29 Sep 2026 22:36:36 +0200
Message-ID: <871pab6bhn.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 29/09/2026 at 14:56:17 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] clk: nuvoton: missing IS_ERR check causes permanent probe
> deferral

Gasp. Yes that's correct.

> - [Medium] clk: nuvoton: hardcoded parent strings cause orphaned gate
> clocks

I don't think this one is serious, linkage is reliable because we
leverage the device tree nodes in the clk_core_get/clk_parse_spec
path. The fallback is indeed based on string matching, but heh, that's
because of backward compat, not my call.

I will send a v6.

Miqu=C3=A8l

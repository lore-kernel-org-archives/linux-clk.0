Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9692A4B0E41;
	Fri, 25 Sep 2026 15:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348839; cv=none; b=iDToCjDZL1HrTg2kPv3MDRIA3jJ7rYP+bJf38mtvGnyf5IQvsZgtGUACDTEIQ8TyRWwI4m/KxVGkqzhM/s3qa29ZoJFA9doemJfzY/xSUWvJCIaV+ufO0lLwExWme1veYP3+WrPBASa5HhTyw6UHTuX2sAYJZzn/IVrm23cXNQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348839; c=relaxed/simple;
	bh=yRg9uMgtdbQfArdMa5OSjR1rYNbXDcEWhDsiE3Qi21o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YsYxdl6K9T7aV+U8m1oSLbW7UXSO207gkwbToRge7Zk4xxn9H8Xa8TPrJAn+YV/prjPZaDKCMCaytfkbI4JRQuSiZVriZwofsc48ylho4VaqzfP485UORh8B2T95GmJQfC3e1RRp7dHS8MUY/SbE0r8LGp3g+/jXF36ezVSHOqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=P2ma7sWy; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="P2ma7sWy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AE3D01A1023;
	Fri, 25 Sep 2026 15:06:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80C436073B;
	Fri, 25 Sep 2026 15:06:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CA75102F1E15;
	Fri, 25 Sep 2026 17:06:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790348811; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yRg9uMgtdbQfArdMa5OSjR1rYNbXDcEWhDsiE3Qi21o=;
	b=P2ma7sWyDVYtcHpuzNFop+wMEl8mVttYEYljrPvd7RABpJZeVO9/IHxrse1e8aTdIdExyN
	0sxtHVOPbDe8JWMJjtGPJX39YOyxJXRVvTDvjwRpxttMQRe9YLLtrKfi8P0ayIonyHXXUb
	k1III/+ya4NzZ6zhWWFaYHwXOVByQRO2rl/s1eNW6mqvT1tJcKTJD3gN1+q4WZoOXjMhrn
	Ucv07EoyRZ/TrpsF6C785566uhwyQ3n77ECGftlUdNDYO2y5MflFETFRKiSFru338tpwIK
	xNVPomta28vdrJZU1oQRIgStaJ2TcfNmpwTM/hKylNlGsN46A1m++0Y3geBF1Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  linux-clk@vger.kernel.org,
  robh@kernel.org,  conor+dt@kernel.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/6] clk: nuvoton: ma35d1: Add missing WDT/WWDT
 parent clocks
In-Reply-To: <20260925145701.6ACF51F00893@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 25 Sep 2026 14:57:01
	+0000")
References: <20260925-perso-ma35d1-upstream-clk-v3-0-ffbae7e020a8@bootlin.com>
	<20260925-perso-ma35d1-upstream-clk-v3-4-ffbae7e020a8@bootlin.com>
	<20260925145701.6ACF51F00893@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 25 Sep 2026 17:06:49 +0200
Message-ID: <87cxu14bg6.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 25/09/2026 at 14:57:01 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] clk: nuvoton: ma35d1: heap buffer overflow when assigning
> WDT/WWDT parent clocks

Of course I got it wrong and forgot to bump the counter in the
driver. Let's iterate.

Miqu=C3=A8l

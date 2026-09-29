Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2434A246788;
	Tue, 29 Sep 2026 20:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790714925; cv=none; b=FT9LLSIsiJDusCoyKcj8CO6Go5L0ro6ZG+KjTzHlgi29dtLs6pJAsLA2SwK4GxfZbLI/YDVjonQRjPR5om5c28M/PM2FrEGDiI672b2m4v07AFDdsK6IENsqjq3WobHDYigbi+E4gCE3HNEBUjr04YQyw3LZ4crZg8Ct27Gsgbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790714925; c=relaxed/simple;
	bh=avJYZWkj4l0EiBcsbVStp2mz+Rl/tkNUwnORB67A1xU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XNmaDrGNYDSDSLFEsZ7/SF/HtzxETlL05LA2GMHxAtYglpt1cx6tFOi3cXIlvoeQhVKmE4HdqbxUt0Szpu068E+8kj/CfXwVYKJS3Dxpr8O92XUiPg1lfpf+Z6kN5UdacVUpxdH9YnTXv9yNlsaRLmk2TsFncWsS98vvPgjJxZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f65rGmgP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f65rGmgP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 75BEC4E410BD;
	Tue, 29 Sep 2026 20:48:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 09D55601BD;
	Tue, 29 Sep 2026 20:48:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D83EE1032985C;
	Tue, 29 Sep 2026 22:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790714916; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4ubprdTX1kgEC8P+y84dilH+rVHlCsjNj9qT0HZjZ6M=;
	b=f65rGmgPRY/awRdRm7IXgnJx98o4gaTYmjW6RTYOqATCfKU6uNyGAKzAnU0qWRDFZQLRJI
	oSBAFrl4KGkFcymPTpsgM2V+6MZobgIiduwtbWmeVbxHWPiTwFmK+Y/TEFF0cPy3z/NR7O
	0e15jPqjDUXMoFfaO9xCQ3txbOhskkKBpZRK1jq4zOZphYVufCb3Q6KkWLzwPJOcgkRJa6
	mTrUH0jAsqn4cMFjq3fxZUdRyYTnt43HXPa+3niYd85P+VdOeDOhA0pulrqJm/dieD3C0o
	lkOS6Onxtq1C7QwBgpff/mRbx/CVyCWt4cgPLwKs/wFdb9/P3CeWV7itmQ9uwQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  robh@kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  conor+dt@kernel.org
Subject: Re: [PATCH v5 9/9] arm64: dts: nuvoton: ma35d1: Add LXT crystal and
 correct HXT name
In-Reply-To: <20260929150121.739D91F000FF@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Tue, 29 Sep 2026 15:01:20
	+0000")
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
	<20260929-perso-ma35d1-upstream-clk-v5-9-68533e935ee4@bootlin.com>
	<20260929150121.739D91F000FF@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 29 Sep 2026 22:48:35 +0200
Message-ID: <87pkxv4wd8.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


>> -		clock-output-names =3D "clk_hxt";
>> +		clock-output-names =3D "hxt";
>
> [Severity: High]
> Could this change cause a regression with older kernels?
>
> When booting an older kernel with this newly updated Device Tree,

I don't think we should bother too much about forward compatibility, do
we? I will set the name back to the weird "clk_hxt"/"clk_lxt" string,
because I don't want to fight. This was supposedly a 1 patch fixing the
SPI controller driver behaviour, we now are at 9 after 5 versions. So it
is time to settle. I find the "clk_" prefix awful, but I'll just assume
it is too late.

Miqu=C3=A8l

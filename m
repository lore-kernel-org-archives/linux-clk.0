Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77C33BFE47;
	Tue,  6 Oct 2026 07:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273469; cv=none; b=FnR7VVDEa4PtkFPcKseQu410QdwkbNI1HGGfjFDpejdCe682MCWA2rh5Hvi1ertK6ubtHMrJaFDkK7u8BIhgBxAgpMoRkv9FhwqRTL1uFzfPrVkWqa69anvhwfZn7vGpR7o7vGRTHGZMlE3FGITdr+7mFlFVwlNMig/4/5runAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273469; c=relaxed/simple;
	bh=Ba8SRvLUlDgJylfpuGchatFp660PUxF7wpMiaEDu7lg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=az6WezOpmVCCF2tbLVY+I9874jgR5lCWPFGfNDFBQv27H22Qvk+r+AU7mU+Yguf2BSpkJzrqBkD+XU56955NibpPIQgYqreTmdTU96S8Jwst0jLs7jdDxWEwkQ9AWKhyDZv4WfxA7TrXU1WEKyrwxXREuZK1/7BiGolAmpSHHLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UaM579DS; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UaM579DS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4FAF21A1187;
	Tue,  6 Oct 2026 07:57:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CE3D6074B;
	Tue,  6 Oct 2026 07:57:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A01B103308A6;
	Tue,  6 Oct 2026 09:57:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791273465; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ba8SRvLUlDgJylfpuGchatFp660PUxF7wpMiaEDu7lg=;
	b=UaM579DS36zpJx7g3lKSM4QpM5nBYHlxvcvaOVnta3Ap9MrrQBcuRiq1Ke/vL5be3uCWZv
	G650XIEWWrxkYxTSxqB2fr8+91dX+KUk0+rZr287zBi3eBAij68sbjMqLoaITgwS3wXkHP
	hMviIYfK3yJOKJweqA+v1Do4Nc8mV7jbbc4MP+GlZA/2wCWrkHyaSvvtE4JFbHCZVyO3vM
	ikaw5V6CxG+4T2oIBgEAYGrquOeIP67zJWe//Gww/0JQ0yapGHdYR7OhgULiDwE5P/7VL1
	f/MKgrV3n9qkZLs0NcZDz0z0mHNYa6BAO9PspAGxjpoUT0Md6ojXNsFKWPppLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org,  sashiko-reviews@lists.linux.dev,
  conor+dt@kernel.org,  linux-clk@vger.kernel.org,  robh@kernel.org,
  devicetree@vger.kernel.org
Subject: Re: [PATCH v8 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
In-Reply-To: <1jjynw7bp8.fsf@starbuckisacylon.baylibre.com> (Jerome Brunet's
	message of "Mon, 05 Oct 2026 11:12:35 +0200")
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
	<20261004-perso-ma35d1-upstream-clk-v8-5-e1a106a128c0@bootlin.com>
	<20261004205551.6279C1F000FF@smtp.kernel.org>
	<87zewti2pf.fsf@bootlin.com>
	<1jjynw7bp8.fsf@starbuckisacylon.baylibre.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 06 Oct 2026 09:57:37 +0200
Message-ID: <87cxtni7m6.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 05/10/2026 at 11:12:35 +02, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Sun 04 Oct 2026 at 23:19, Miquel Raynal <miquel.raynal@bootlin.com> wr=
ote:
>
>> On 04/10/2026 at 20:55:50 GMT, sashiko-bot@kernel.org wrote:
>>
>>> Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
>>> - [Low] clk: nuvoton: ma35d1: Modification of global static state
>>> during probe
>>
>> There is a single clock controller. Should never be a problem. I can
>> certainly move it in to more local scope if someone asks, but it's not
>> practically needed.
>
> I may be missing something key here but why is not in your defined
> indexes like the rest of the clocks ?

SYSPLL and its parent (HXT_GATE) are in the hws[] array. Are you
suggesting to use the hw_clk pointer directly there instead of using the
parent data structure as an envelope? Because the issue raised is the
global definition of the struct clk_parent_data and then its
modification (since I need to reference the hws[SYSPLL] pointer inside).

Thanks,
Miqu=C3=A8l

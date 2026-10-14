Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925FF4AA1F1
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 08:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965795; cv=none; b=IL4j03PpjhmfNwbKigz4vJblmey2L+40pYxmW/xDkLPcnAbwxkvlwHQ900HD1bcfPijnJYz9FuUiGaSxDk3jvD3TMAzibfgE3EW7eMdvFxFe7SG0b+R77pyYn1zeTszJhkDTNeTXai8hRN3NMBrjoEPKNK3g6cEeMzSy2PP+sDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965795; c=relaxed/simple;
	bh=hZLSLpYUceXqeAlJs1SGFXHUEaMZIiBDD2tfloV6vso=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bFxRujpyXmTEZ4fUhrWtnpQxzuXV2VvW6o9BcAAgfRLcpjr47/VlFnXYoN0E2dcdwupMr3Gbtj9e5zhF7oyyhsKzTX+FJKdPMGXsGNkNHCTY25bbBFA7HnVjfr1fhsuI+dYj9S2bw1RcdHhlqxb4WriZ2EQhGa2h5JnhyVcPrLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jTsGER6I; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jTsGER6I"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E1F451A1224;
	Wed, 14 Oct 2026 08:16:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B512B60368;
	Wed, 14 Oct 2026 08:16:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7915110328695;
	Wed, 14 Oct 2026 10:16:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791965788; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=9fBzjBWFBjrwNdZrnia/P5F26SGcdCw5WRLx/ScX9aM=;
	b=jTsGER6Is2Gtt4G7H9qOMqU2QJ/f/voeHAhMisOmdNc1lpUuttpvz6+k9vtIyGSsC/6OER
	zaqN6+pfJM3pUtb+j2zbLkeoRVaW0m8XJPV1/c9EqOR+f0QLZpwxTpWpxtm8sc2trbUyx+
	5XnafQhcy1AIBkKmqKvB21krSl7saadyEXvJ6IzMLHMGgJ0hP9LKr1OtRbHbJGQl5beGn8
	mEm+y75JkXID+PpF4n2P0Mzy0PCMsebeynIaku2uz9dYJ7i6lAscBR9XDYW1I3Dj6Moag2
	J15qhW8fuwQ1b7h8CBNMhyNZJrmWXVDXeNs9qVu7lfq5co1trqbp5VIUdh7f3w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org,  sashiko-reviews@lists.linux.dev,
  conor+dt@kernel.org,  linux-clk@vger.kernel.org,  robh@kernel.org,
  devicetree@vger.kernel.org
Subject: Re: [PATCH v8 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
In-Reply-To: <179191307176.266355.13493126045902473311.b4-reply@b4> (Jerome
	Brunet's message of "Tue, 13 Oct 2026 19:37:51 +0200")
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
	<20261004-perso-ma35d1-upstream-clk-v8-5-e1a106a128c0@bootlin.com>
	<20261004205551.6279C1F000FF@smtp.kernel.org>
	<87zewti2pf.fsf@bootlin.com>
	<1jjynw7bp8.fsf@starbuckisacylon.baylibre.com>
	<87cxtni7m6.fsf@bootlin.com>
	<179181904945.33566.17882786294681341398.b4-reply@b4>
	<87ld81v8y1.fsf@bootlin.com>
	<179191307176.266355.13493126045902473311.b4-reply@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 10:16:25 +0200
Message-ID: <8733u81yue.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 13/10/2026 at 19:37:51 +02, Jerome Brunet <jbrunet@baylibre.com> wrote:

>> > So 2 possibilities:
>> > * You just need the .hw then I don't really get why you are doing it differently
>> >   for this clock ?
>> 
>> True.
>> 
>> > * OR, this is one of the those clock where you want to check DT first then
>> 
>> It is not.
>> 
>> >   fallback to a fixed clock, then yes you need parent_data. don't forget
>> >   the fw_name (which I did not see here) and use a local variable for that,
>> >   not a global
>> >
>> > Did I miss something ?
>> 
>> You got it absolutely right, and while implementing the change I
>> remember why I used the name instead of the hw pointer:
>> 
>>      clk_hw_register_fixed_rate_parent_hw() exists, but
>> devm_clk_hw_register_fixed_rate_parent_hw() did not.
>> 
>> So since it looks like most of these helpers have their devm_
>> counterpart, I will add this new helper in clk-provider.h. I plan on
>> doing that addition in this commit because I think that is what Boyd
>> used to prefer, but I can add it in a preparation patch that is your own
>> preference, I don't mind.
>
> Separate patch for the new helper please. Same series is fine.

Ack, thanks.

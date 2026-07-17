Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7001138B7D8
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283237; cv=none; b=X1bgBueJ27MXe2z9UtV52OQn83FxPN+3c8OJTmRKfL+uMsC/0JNNe0RVTeIQW/5Zn/i8J52r77Ck8v+JNkpBtgRu4qc4ByQaaFhftUw66Z9G3xDVLSly5IflA5paxYfrrS8TIVksqwQxKWI7NoC9Ip1I6aP3feMXSwvW7MWv2bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283237; c=relaxed/simple;
	bh=DpwpCaXus3svJj1RfqK72wYBiFj5X7y/zv/skpycSXU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pzsh4QKU0L+nsA0dJ0d7pFWBY786TeYA9DD6CIwPXVOrpzcxNlpkGEe0oJy6qD2U7/bSxHzo4B/2Cko8gOsYtI/t/R/T7cR+oBlt3iz3yDpDbti/PYn+8OeZfCC/KqJaezO6Zo1dSWMzxXdGPxclQVrePhxGjDuufEAu0XjYotM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DMw8Wgku; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DMw8Wgku"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 64E871A1039;
	Fri, 17 Jul 2026 10:13:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3870160361;
	Fri, 17 Jul 2026 10:13:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CAD5311BD0158;
	Fri, 17 Jul 2026 12:13:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784283229; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Cx0uFeJGkv9sD0diMmd3JC9xVYyXEAyu9sUn75bA9q0=;
	b=DMw8WgkuABd1u2fnu4r44g+6uCI1HRkh+NKZRE7HKwCmNXxtuejHfwmeRMe/zyEg5uyNj1
	asYt4HD+ZRGlj7YRphN9uFB1x0nt6B5iFytNRQSSQ4f2IPRt1yNFhxjhQqq25wlFEnIZrC
	qm7CsJAivXXzzsT4vYva2GqD6ZKq7cW3uFvdd6AHfKLll3XlU/cpAZtvcIs887iGBFJ6Tm
	OZNdNQY9BOKNrSPH1jyqlABwH2apcUBU+3SvQDKCxBef6oCR/NB0g5IocVvxEsoegOZiQ2
	HDVctoHIhEXWFdV7GurSVTLzuPI4Hh/YpgxECAv6RyamA21lfZSufUAf2x2hbg==
Date: Fri, 17 Jul 2026 12:13:44 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Daniel Machon
 <daniel.machon@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 1/1] clk: lan966x: Add MCHP_LAN966X_PCI dependency
Message-ID: <20260717121344.38a6a0f9@bootlin.com>
In-Reply-To: <akvcmiJtO4LpHA2N@redhat.com>
References: <20260630103052.413750-1-herve.codina@bootlin.com>
	<20260630103052.413750-2-herve.codina@bootlin.com>
	<akvcmiJtO4LpHA2N@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Maintainers,

On Mon, 6 Jul 2026 12:49:30 -0400
Brian Masney <bmasney@redhat.com> wrote:

> On Tue, Jun 30, 2026 at 12:30:50PM +0200, Herve Codina wrote:
> > The lan966x clock controller depends on the LAN969x architecture or the
> > LAN966x SoC.
> > 
> > This clock controller can be used by the LAN966x PCI device and so it
> > needs to be available when the LAN966x PCI device is enabled.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>  
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> 

IMHO, this patch is ready to be applied.

Let me know if I need to do anything else on my side to move forward.

Best regards,
Hervé

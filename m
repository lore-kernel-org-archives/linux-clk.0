Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537683;
	b=VpCJBp4gFbkcuPtohXQz+1pvK5hB9WRT42BiE9MRpfE4vyXJr0A4kCAjILwqPEPyIZv8
	 gIEvgIMVi69234FNryjqAjesDy9zCtYKAmSq5gM7ESpnHb6Orceavj9p3g8UoFN6FgBhs
	 bpWkV/YJCpwtzMBb8P6eKa3pXSNLT7lq4Dgj7ExozvVK/r4GQEvcvf4cBx3UQJ4UNdaj8
	 nnTQIaVUpgQ7EbXvyPJhx9MfatTAPRv9f/CQ06x9iojWo+qdd1hRNUL1gk5g4WND3c2Qz
	 keiALiR7afpelpS4fsJP7ADP1gZS6jFGaPte6O5oZJNwxgiUzl9hfHtIO19/R2AmhVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537683;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=DkZ1ABuSs0XqFw9KTioPWKhCAj31GhHamAleqCJ6xL4=;
	b=HTmg505hdXhrGwlfTlsxnlsUwPA+xr/ABSlpZVHY9kACuC0RZQAvyOG5ynCBm35MA3Xf
	 QiF2u4PKG7BlAdtJnMGSjnZpGZ76Epn9JfonyyQ2mxIBj888tsDzcQXT6XMYsCfeZxMtz
	 Y4c4VWCafQK2G1C69ROqKiVz5SXmYg5mq8ObTuHoSubhkLJlAnVWqh/7TecS0ASNfCD//
	 1K+bkLtAQz9N0HHvO7wPVN1402vLU2ljAZy5TCejIoTp5uwAWiGg+VjFiMihOJlley+8l
	 +3T9nP/aI1CRB/0RByrzeHHywNrRo/Wa3s7BXcIA8DhF9DK7lPbuBpFw3SVNSmhxNTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VX3JpSiO;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB0B606A32E
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 16:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB0B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VX3JpSiO
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8062F4E41746;
	Tue, 24 Nov 2026 16:28:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4031D601E1;
	Tue, 24 Nov 2026 16:28:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E60F11E685A3;
	Tue, 24 Nov 2026 17:27:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795537674; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=DkZ1ABuSs0XqFw9KTioPWKhCAj31GhHamAleqCJ6xL4=;
	b=VX3JpSiO8UcsPsmc75P4wD4phG8vOx1B3MRJNmTyfC7zJb50+OJmlJSmktDpqTssYXTRYN
	WtnjgCsJtxVUkuwCv1935gtQllbTQllpi7dDfBel5QJxh598glIlMV3QxVubhw4K9jK5bc
	NH92hMlCnISr9WG1VAfTqLNbx541kJOPeLyrENcQq+zjNnKBpT1pFT/IFFncSSjkWJkhgV
	srDTCwPjFpYvNGTtZNFEOYJf4aDfR8Y6tnoocc+w02VBnzwCWplkU/2Y4d8ujgEavS3sOh
	4SnPKaLdxWZaKdFxLtcuSiWa7Bc65AmwjNLxFrlalOLO55EJvTad63tEZLqz7Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Richard Cochran
 <richardcochran@gmail.com>,  Arnd Bergmann <arnd@arndb.de>,  Brian Masney
 <bmasney+clk@redhat.com>,  Jerome Brunet <jbrunet+clk@baylibre.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Avi Fishman <avifishman70@gmail.com>,
  Tomer Maimon <tmaimon77@gmail.com>,  Tali Perry <tali.perry1@gmail.com>,
  Patrick Venture <venture@google.com>,  Nancy Yuen <yuenn@google.com>,
  Benjamin Fair <benjaminfair@google.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Krzysztof Kozlowski <krzk@kernel.org>,
  devicetree@vger.kernel.org,  openbmc@lists.ozlabs.org
Subject: Re: [PATCH v12 10/10] MAINTAINERS: Add myself as Nuvoton MA35D1
 clock controller
In-Reply-To: <179519171774.3795820.3121589367853881174.b4-review@b4> (Jerome
	Brunet's message of "Fri, 20 Nov 2026 17:21:57 +0100")
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
	<20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
	<179519171774.3795820.3121589367853881174.b4-review@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 24 Nov 2026 17:27:43 +0100
Message-ID: <874id6ry80.fsf@bootlin.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 20/11/2026 at 17:21:57 +01, Jerome Brunet <jbrunet@baylibre.com> wrote:

>> I have the platform, I currently use it for my developpements and
>> therefore I care about the clock controller driver and the SPI
>> controller driver not being constantly broken. I would like to step up
>> to help the Nuvoton team (not visible in the diff since they created
>> an MA35D1 catch-all entry) in the maintaince of this driver.
>> 
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
>
> Commit log nits:
> - The subject is missing a word: "Add myself as Nuvoton MA35D1 clock
>   controller maintainer".

:-)

> - developpements -> developments
> - maintaince -> maintenance

Will fix!

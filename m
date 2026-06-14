Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FCD30FC1E
	for <linux-clk@vger.kernel.org>; Sun, 14 Jun 2026 20:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781469580; cv=none; b=FJf1KK3POsNI5oJz3lDSbR/TkvcZrAhO9Tc5aZ5O2GE73xKPpNPE0levvv8AQcBiD+YRjfK1tHIN55qILpp9LayutJZaVylS+/tXFApldLwHFXlkZKpmvnK3AfRjJnQtGlVkwrOIbocvqG4qDIwyEP2KPuUOk5W+waodJpDlZQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781469580; c=relaxed/simple;
	bh=Ko6uOwd/TisvMAgBYrzVjK1ghD9KlO9FminlvR0nz4E=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3Ec2F6lzXzSzd6RCNdynjY6E8nt4wx7932p/mjeiZ7adA6QhLrczUyjC/TCFMJpLYUVXf0Lzm1IsABWEU8095/8HWKg28J6Xd4+34IV6E3i3SvN+CCjHYYI239I6QzheSYBsrbzTYO3ynKm1VzlO/JniV3Z4IjqxMUKu4DPavA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HpU+LKD5; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HpU+LKD5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 269D0C4FED9;
	Sun, 14 Jun 2026 20:39:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26D5A60014;
	Sun, 14 Jun 2026 20:39:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85C9B106C86AA;
	Sun, 14 Jun 2026 22:39:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781469574;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=/cwZEmaxV262lOCKH7K7Tt4ZA+Bva0faoaNw+ZyMjHM=;
	b=HpU+LKD5So7GqO2NxkdY4wTVz5kQaBS/m21yAwQydCbgAAtiMC/qimPpw8cJXCnOMR9Ywj
	74hIiPP2c8dRHoWwvlZXvkPqzHYmIlaEeYRvrn4Ffe27Xwe3WMuIs/Qt6rd5k505FsPxLV
	HAmT0o94QSEgP1grjj6tng8PjMlsDQgYMLl6I5zfb/B9h2np8UX18F9/GcUBuk47ZKlYfZ
	8S1gU6y9vrkJygopAolqgSpPVKXgQZz1YBP38NJqIZknYjPjHQcb+GerpyHbYwVIwjm9J4
	TxHgJ9Vq5W8he24goCA3uAjKURpmJKb9c2sxSpmc6FJ5l8Q+0Meo/b2QtpA02g==
Date: Sun, 14 Jun 2026 22:39:28 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk,
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com,
	aubin.constans@microchip.com, Ryan.Wanner@microchip.com,
	romain.sioen@microchip.com, tytso@mit.edu,
	cristian.birsan@microchip.com, adrian.hunter@intel.com,
	npitre@baylibre.com, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: Re: (subset) [PATCH v7 0/5] Add microchip sama7d65 SoC I3C support
Message-ID: <178146955570.340851.8125558640090329050.b4-ty@b4>
References: <20260525092405.1514213-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525092405.1514213-1-manikandan.m@microchip.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 25 May 2026 14:54:00 +0530, Manikandan Muralidharan wrote:
> Add support for microchip sama7d65 SoC I3C master only IP which is
> based on mipi-i3c-hci from synopsys implementing version 1.0
> specification. The platform specific changes are integrated in the
> mipi-i3c-hci driver using existing quirks.
> 
> I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
> mixed bus mode (I2C and I3C target devices on same i3c bus).
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
      https://git.kernel.org/i3c/c/9092105b87af
[3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the required quirk
      https://git.kernel.org/i3c/c/efaa912ab0f1

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

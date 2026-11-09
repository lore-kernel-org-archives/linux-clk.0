Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794257966;
	b=eue1eAZDW9G5OHe+pej45BmV45OY6Z7GSIPvchAIBWjeIEwexp29Y7ho5l8AGIIJDMe2
	 vGVp1e7l7j+8YXU1i4JGykGKP2bJ6xIf5q5NIKdQID/2wgxey+u1bnnENIa+DM3CHBoY3
	 qTdbecASNw7GHtanSmeKRc+6BWtymCrKjjPqtUKr4IcKG9cBqs/KdXIRjfpbc2Erbe3Yu
	 D07DkOPwXJ0beAOTjPyMVTaZshi4HBaPZPJokDNtwMNPgzo0hoQvLetNGupJP3nzqEjsi
	 0Tj30b7GyO0foAmhPdwwh3EblD3hrSB33qb9Aqj77jZVzDF1rqsknojQrKPG8OykSSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=h0yneiKg7DNhOrT8jayZCJtlhVR9ITH7sa+yxZSUWfA=;
	b=0DZpjtBbrjHqHjPXsYpv3iVseVtjlfwHL08U9KT+we46pf5hn84iOStu9AewJT0UVMyW
	 A7dD44kUMOcMa9jeZlt6m0ZMKBAKdxXnI5QV559KRTGbSahZyQ2tlYbjcyoM0x0fdLCMk
	 PIsO/QCbCTD9rhfSOWljaB170Ws6FZwoagGmxS+uaGNJsNSP3UCLd/03QyXleRncoMfkS
	 XvURhjxvyEbr9FozL/5ZJidtCWNZ//Rvf+vMjVefj3UI5a7iYDxlr8R1CZ2unYlSBNHcx
	 IqqpTmhBpbzT41sYlMjEpNlNQxRNpEGGcYGw6rJ9fExPLjPk53aa4hywx2kZoz0MRng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="HrReEgn/";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5285606A33E
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 20:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5285606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HrReEgn/
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so8829785e9.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 12:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794257964; x=1794862764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h0yneiKg7DNhOrT8jayZCJtlhVR9ITH7sa+yxZSUWfA=;
        b=HrReEgn/ryRpnI97jiAPLAbpUyzbD8Nu1QgEKRMLKm3Qb9ghk0pVkvKJqnZjkoU/Mo
         pI7B2kT8G+t2yqczEFjSQH5wI4AQmm/2b2SNkvpGI7f+Cw/e/8BJpkvzYyqvHpwENrVL
         54vgxTEAAHwMYbYL6qJ4Jvl2336kdXAhch1ZkHpOto59XHgBphOWxjXbsQcNCfMkSNJq
         KD5v3wggFRgjUPe7ETFdhPD7+9/HwZ/UWBZDABdnZIJlrbvUB1eNJuaNGnpOHhEygA/z
         A/eN0sdKmk+xmiRSg7aikhyolCtQwuYCFPruQWa1BsXuFjh3k3DVwQ7lRewSIiFiAP4A
         Y2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257964; x=1794862764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0yneiKg7DNhOrT8jayZCJtlhVR9ITH7sa+yxZSUWfA=;
        b=UOLwXzHjjF/mn/+LwKxJUUbEZ0u5i4ushbkj+UyB8Qq7nnqoYlfLEBsQG6+SIn83ro
         h7eZ9/kCNYmsGZhk2UiiP2iBuvCb9jAwtiXwI7kG+nBmrji3Mg0t/HJ6qWfTKZtUAika
         dOohzGpm/rIGruoKufZ4LfyuGsRBT2z3IXnIQmsxm//kFCFRlPExoLw8Y7OEgxr+Tauc
         8hOhS0Q+om8pPmpVZZF4Flw55/jPizB4enFkO8nAWM8+InWdrxhAioCnR8lfPATl4jF6
         O54F5roaMickbvoO5imNY6f00UZaXDNRPAlqrhMRKdfb6V+HjP5WnKJ3eP7gajldw/tY
         MOKQ==
X-Forwarded-Encrypted: i=1; AL+hErG5QVEAgjBGIAAmkcZoWPTapAHRYcmvl/J+RzS5ishUNmo3mjqVUXPdrddMXh0w05IZpMDqUOw106Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s3wS4V79pc6TcreQvYOSujIWLBkJsEMZIalEVzE6kr6ehj/bq
	1C7ibjehAsa9YLWrfquF9GJykGARi9n3vQGyLdn94Zwqt0orZ7b+YEKw42H1i9AFfBs=
X-Gm-Gg: AYBFou3UIs7TWvX2SF8wW6q1/CTO5vOg9rTlkpeReBWePmUIK8hDfA08U0YRuLZ6Wyt
	U2FI4n1rgMn7dQJQK0fk5YBVgy2IMLyQTU3rYocwArNVq3Ji5b4FFp4AWUDFDV7qd5L0gTVYpZQ
	z8P8Vi+y7BO/pmkCZI+i+owrCs0ERUxvAPKzFYVx5tzkDSRiGbHzUQsxTvrJS0idKjO3SvzluDf
	l1vOFM3UqFLeSAZFwFKdg1GBTf8JXzFh5C6ilHldzq/MNza0S71NtgYBVmLxOkOhdC5sthy8ZkY
	8bJCBaICW1am6KLrPdsdU4I1wSpG2c/x6KMlAwfAJOx3hPXSuiWpTrs1GbNvxqcy9BTTz2tDsvZ
	vBsdidHXxeoKi35HO2VZOTw2dgvErPdxS6SCE7N5WoKHdErAcy0zHbMSA/1K09jHsyH0ABoXADi
	k8C8QTVFs00yLLvG9YsSDRCo0y9fnmhizCMz3YX5m9ra6T547S6KkKlibHWVjihLa50Jy01hxxD
	jJ6zdJ8A4QVjcLsec9CTM2n3Cg2ZPHdNuo689H+EB6KDyf0JadO8DSpe6kCXrpu7Cd2CeGo8huq
	xwSEsyE1wer6ll7IiY8mezy/9gkIuW82noBaWMTEoVWj8EfE8ZF3rSKqz8e04JM2XAv/LudtTIl
	EvGtbi02nULOrGXQXWwEXLRgLtJP7Y9Ump3UoZEcWY0ROmQ==
X-Received: by 2002:a05:600c:3d96:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ba02347dc6mr6849605e9.17.1794257964075;
        Mon, 09 Nov 2026 12:59:24 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c99bsm1081150f8f.7.2026.11.09.12.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 12:59:23 -0800 (PST)
Date: Mon, 9 Nov 2026 21:59:22 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
Message-ID: <avIv2GfXHuOPWJzC@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
 <1jfqxa1jv7.fsf@starbuckisacylon.baylibre.com>
 <20261109-stature-splicing-a146b4cfaad4@spud>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-stature-splicing-a146b4cfaad4@spud>

On Mon, Nov 09, 2026 at 20:00:56 +0100, Conor Dooley wrote:

> The "document" in this case is the source code of the firmware then.
> The info might not be printed in the TRM, but it is determined by
> something, Carlo had to get the numbers from somewhere?

Yes, I got the IDs by enumerating the clocks exposed by the running
S7 firmware, logging their IDs and names through the Linux SCMI clock
driver (using a vendor provided firmware and kernel of course).

And yes, the DT cell is the firmware's SCMI ID, passed through
without translation. Renumbering these definitions would break that
correspondence indeed.

Cheers,

--
Carlo Caione

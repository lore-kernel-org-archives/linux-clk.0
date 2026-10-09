Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4516851A152
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 18:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570592; cv=none; b=B9TtXL7dTz2ZAdQ53/TyF8RY28AxOevikF16wyjTMyQw4l5oMd8bIKO7juC8VN0CznLJNyh2ymmSlwG+KsYMV+5+BefGrOu0JHF7sRJ4vdD4VCJi289fHPZaMnLfZmy62/MN7+SKO67zYasnFSAV7XwrO0Uy2wgdri7tK3XdpXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570592; c=relaxed/simple;
	bh=8HTt3f1kHzEcHqPdoIhUIJF/xyu/LEyQE65kAFS6OjM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=X3HSA855jUB3w0bXdMsj0xQ70U9lxWw7gB7UTaeRRfq0eXfla1n9zoneEIl3q23nQARVE+D+6og0A7L/XpHe+K925QSQow/imKqv1WgPKtyaVT6ljep0OF+Dz7u3hTdrLIGEUZBw5kDGg9wsnGoIDUoIeOhEPCJilY/l5RX1ouI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NFIQpbsI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NFIQpbsI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afbd2c386so51536f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570583; x=1792175383; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3K3ao78imzaTxL1NmkWMqiHtKHUZXLazwgVZl9X2sac=;
        b=NFIQpbsIwd3TNsM3/p15h9/Em8NjFJzbsvqNQwftlCucUvzPf+8y0HxLla/3xN1OcO
         SQ1llAGiDCpevOpQgWTdU0a6RnLnayKUmhDBQG60vgwsTj06+gT7dx6UB3OiVPHhFvTu
         U5g2me+ZHVFGf3zvDGM7KgTEeRD6EZXYqh2oLd078dkTOUD9JmJaXdGkN7+4Ghfo88gr
         CgLZ4PABZQgvqsaIala/VcsAzklhsYIIrYwWlsxEUO9ALDJglbmjBwrsV0mJ4dy2gQQf
         5BwVnLES6SF06Gk7DhmXzHDcSUzercK2zsenVGAfXisurnz9p9IQbot8lYjU6kDmECsL
         U0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570583; x=1792175383;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3K3ao78imzaTxL1NmkWMqiHtKHUZXLazwgVZl9X2sac=;
        b=CT2nRLcqqaS5nolsoa9lsDykTYlFkDBJ3uvZqyc2tDpg7HOEcMEdiBeCOUGYyvHlrP
         B2KDQsdrnSGYBiGu/Xo7T5t6b57raBnk96wlAGkM3bkdh7ldQ7RioLSzocWJSfmBH5tW
         fo7DkHP1GrghNYBZHYqX7TPOhmqnPju05Shkau7IIgVfvwUcafjy3QtyGTXeKQIRiBpe
         u+fSP82vbiZYUuDkWiUWL0O7Ra36GBmsiMC2Gx+Nz8mzF7bWEUcsHczGdkiAFT7680vl
         +z89t+4MDSneYtkrPgAoClVP2kOjcBIDObWQVGfRr+g4zhZB9tdjflKJm667CSM7WycT
         j+JA==
X-Forwarded-Encrypted: i=1; AKwUvByIhF1ZSaSJxYxKtgA52DgmCHEyln3jaJFBQpssygE1hYji9N6yVkX/mUKyj4EJb0qGldc2dHmM8VA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL7Rq/wjSq7P64zBb3X/ZOJSL57HfXMhmPQ5NxOWfze0JekVGo
	A+wgnVsQ1NlIHVUCKJso1jQNRXpA9kAuZ7LFpxRsL1LZLf3Uha4mhnBIQb+5JboNUgo=
X-Gm-Gg: AYBFou0PAb1bpDZPK3RkmEwL9mgdeinTbyUt7ePyBWhnsm7ylpJzqQvq3D8Csr8vGlN
	HYVr6A9XEFkWtAhhRhZvaf10Jke0cpJ6TL0Ey6XOgrfFIfEmqHK52q2ODZaEaoiiKTj+SeXA+OZ
	03e5LbbtEruxhnhclNOgusWPr2+qv3dVTf6pbN2N5OcdAXlQeFW+IZ9knYl+8U2JFcjRDWPOlJw
	BUazTqfgUPij4arcTotgke+U5kKy12j6S+AqY22+lClVvtWxoK619xkOFJYWWNSM2QGMoaEtgWI
	HFvM10/46wD/vCz5Esoq1g2pw+kZ53S4kMaiTSmarRLjp0SkhehL6eaFBxP3XX5P+Xr5YO3kbcu
	nOgMY7qIrb+z/lD+AKxX5Lw0WgTtaI2G1c2Y2z9i7rId199MkipWseeBF4J/VqkvFoYkd39b0Ao
	RQkFQ6u3YQj9Cx8iVmVgGLKfqedoymIi9qiw2VuRFs5/gZFmTMh1t/GzdNzICeB02VbmIn9JUEu
	LIOijAVWezm6Fh1Kg==
X-Received: by 2002:a05:6000:184e:b0:488:8904:cf19 with SMTP id ffacd0b85a97d-48dbaceb60cmr6202771f8f.10.1791570583358;
        Fri, 09 Oct 2026 11:29:43 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac025esm5100156f8f.38.2026.10.09.11.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 00/11] clk / reset: realtek: Add RTD1625 clock and
 reset support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com
In-Reply-To: <20261002074331.3066919-1-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057523.266328.2566485767894163325.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=735; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=8HTt3f1kHzEcHqPdoIhUIJF/xyu/LEyQE65kAFS6OjM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaa+4K9V8u6b/PntowMt814KcwjOWLFsVd7WeS7Vd
 5JfHvsW1VHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJeMxk+Kdit0ivKsB0Hq//
 hGXK773kWRh5mwJXzK5OOMuVcjRSbgXDfycJszeN584z66no9p2bq3tOv0CZ+e22l0/O9k//vGt
 3ITMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Hello,
> 
> This patch series adds the clock and reset controller support for Realtek's
> RTD1625 SoC platform.
> 
> Because the reset controllers share the same register space with the
> clock controllers on this platform, we utilize the Auxiliary Bus framework
> to decouple them. The clock controllers act as the primary devices,
> registering the reset controllers as auxiliary devices.

Considering those are properly decoupled, there is no reason to send them
together anymore. You could send the reset part to reset, and just clock
part to clock.

Sending a series that address a single tree helps because then we can merge it
using your cover-letter as merge commit, instead of cherry-picking.

-- 
Jerome


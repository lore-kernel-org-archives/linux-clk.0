Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562304;
	b=sYA3lfpbHYLYwwMQIXiTWFayNAlhzkyypPiz+jjM3+n8+4KKOZhOpgi4wOBercMNXnBj
	 N48mc0UP7tQq5NS6CPeXkDk4Z0PjGgKKN/geYIViyXM1LTEdi579Rp3CaPLrrtIQ2L4V+
	 UAdraJYwQ/zdLKRMU8c8FzhgXKlTaxT/r+Wne9E7F8aHw3PRZIKelu0Y9HrRzOzg4Qjgs
	 VCuc3/fTepn5DK4HyE7tQlvg/yBNNDuivp+/SwtLUkGDfksiFBBkEMCxU/q5QkhTQe6Oe
	 vOOj4Qzv0JFFnOnhVVemsOTjqHvXJbAhvzkAYQRDzbN4RtA1l+6Eb6o57klpJ0LnX6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hnvQHR4Bfj8vgJJv02cg9zan6ZOhZyTgkfEMX5BVsDg=;
	b=TsUuLTRr83hL0yLphyKvHUftvZMdfDpHhZb/yzGyY2rL64bL/3iTa37KcNCcxA4nmN5T
	 oRAUW2FkevF04awSNO9w9fXWg1ntbCDoDJQqd5S/A1mirjAKjTTA1QhoTlIHm3K8DsVX4
	 zL6XziotYQ7wq4M6w5LqAZvllU/IQmBIKDb102EXBEOYGF0P+GhQ1PF/pwttpIpCNV9vz
	 cLrrKVu0U0JBE2WxISiMSpeLe9E9nmxOpf6oCSvCVP/CQWK6l1jSlSHfE2WbdG+wDzfXT
	 uGf9c6RDT92gqRCTmnDxZi7f64+oRqCNz86DaEfjAWsPiy9U70T8+s1EhdpBmpOIzMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3Aq4g9d;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA67606A337
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 23:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA67606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3Aq4g9d
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so49767845e9.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 15:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795562303; x=1796167103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnvQHR4Bfj8vgJJv02cg9zan6ZOhZyTgkfEMX5BVsDg=;
        b=I3Aq4g9dwsSkjc6S6FBmigKwbd2Z5Ad5XA7dl/x5cgNaGdLYOrJ5nOn/pkCvR1XP3y
         Kal6QMH+Gz0GJjxT/rxdVlrKIH+HSI9hK+wF+I67b8qG+W/B16oZZk3wqn5TFAduGbyC
         r303RwC8nEjSOvbib2cTI1k4PC4fBKj6vNraDaj6IglrIm9T2iPvjdvZagDkfnFIwVvu
         lTW6wXdSEGifyD4kh0pnVTXznN3nCyZxyyojVhMUH2+yKYunOIm5lUjvo5iuIDOGCu3g
         szLiRTfL0ct4N68VNIFZl56gbw4nrn4E5FxNtHjmQ2Z747ipIT6Fu2bdgxK0JF+1vmxH
         EC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562303; x=1796167103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hnvQHR4Bfj8vgJJv02cg9zan6ZOhZyTgkfEMX5BVsDg=;
        b=aLujk+sqW3apsoD9CiVd4u2afPF55MbMEIModYmRAfdHk9jwqnELwKBw3BgmjZa3RP
         6Ipsg+ljGMkdP/QW5bnGfTPM2NR4o41+8zYqeWMoCrkNx10oYv/c0mXrtOLOMhtX3Rrd
         OBgMf4pFYTJIIInjk6sRCPzwIi20jmVvZmW0Sm9koOo+N4OPAGAEECwcc+pAs2a5i/No
         txAbI2hcWfDEZ1o5RRc8VJNIMC0YQsiLHH44bpKbyH4i7a3RTJEQXnvWENMPZucBtpPt
         rIeHXVABG4Eb5SJdzSxTfUekrzCUUNmjslZRMQyMhP327BHvmapk7XGd6DNIpGOZ0AT4
         hZOQ==
X-Forwarded-Encrypted: i=1; AL+hErGB0JKK6RMvlbCsRXVTnHb2F08Xm+v5ez43Oha+l3inGvII4smc3XqBgLoTULXiyNJoAlv6zreNgik=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5Yv68VOg7AAkMgBnwUP9Ckavl5KOBm5TIdobP8Wd82ESyqSLC
	3IkfK1RKdfFEEqWXF0DC1rTcz9EOazOc9XvGN7RXM8iUYcKBsiK3P/YO
X-Gm-Gg: AZFdTZfuyXizhiik7SWZ9z8VZqShHDOWG2o80DV7fVQ/g2hbFb2UbAcJUuKHjQc4VjL
	Nvdhq4UJ/VOzXMce7p5s+1arUYrH4pQ3pdll/kXPQm569BMyuoMFaHj8N0j7iORyqDxYJWCax5w
	4IMsfjya7tIP2diTYnib41SGgc4nYKH1cEFoOKIGHw+5wysLox4+5uCnhwnyUIxvdy4jFFHtFTE
	jF9b2Et6lKeDgUOehlTNlqb+Ki7zd9l3y03fdFZDTn89rYgyUdDFtSq1b7vX1XwfNcWKbqrt5mL
	xO5EJnaKkDaPUCoz9g8Pfpuk9Ih931bX/PQHi07nbo4U9GFRJjaLRMwd3zGNsEeGXa2cTKXMgZM
	o4Rz0/TF4fxbqwsEznV+fPi2UN191pAYvd3auonj2fbjzhZ4HgzLMOmwNTqSpd7XRDCP3ilVWtG
	965IYy/grdo1SAW8+BqEbFCr5x6L8DadswwFLwaD6pnk7sAqiMWF6PfEImzc+DQhHYFiA9+M8Dj
	JH7VXquFy4kqwd53WPb7KpwHv4hgHn+Bb4UFNCW47+fbTy5q7R1hXk8rrf+7fNUjHO0fhwppqjb
	6kURKhl/YmXJKfBHO8XH2pVqusA7q1Z348xS2Hb2yjp99ePbNeCROQ3Bj5YeLiPUu1kgRO+uFvg
	PQTyd015T5Vk38az/2A==
X-Received: by 2002:a05:600c:4e8e:b0:4ba:59fa:510e with SMTP id 5b1f17b1804b1-4bb8893014dmr330709015e9.23.1795562302885;
        Tue, 24 Nov 2026 15:18:22 -0800 (PST)
Received: from localhost-live.home.vlan10 (053d9243.dynamic.tele-ag.de. [5.61.146.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm554400825e9.11.2026.11.24.15.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:18:22 -0800 (PST)
From: Joshua Covington <joshuacov@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <masneyb@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joshua Covington <joshuacov@gmail.com>
Subject: [PATCH v3 3/3] clk: rp1: reset cached rates on probe
Date: Tue, 24 Nov 2026 23:17:51 +0000
Message-ID: <20261124231751.83938-4-joshuacov@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124231751.83938-1-joshuacov@gmail.com>
References: <20261124231751.83938-1-joshuacov@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock descriptors are static, so their cached rates survive when
RP1 is unbound and bound again. The "varsrc" clocks then report the
rate of the previous probe, and the audio PLL and I2S clocks start with
stale cached values.

Reset the cached rates before registering the clocks, so that a second
probe starts from the same state as the first.

Fixes: 6486341721a2 ("clk: rp1: Add support for clocks provided by RP1")
Signed-off-by: Joshua Covington <joshuacov@gmail.com>
---
 drivers/clk/clk-rp1.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
index 1dd276dd2b..60037b19db 100644
--- a/drivers/clk/clk-rp1.c
+++ b/drivers/clk/clk-rp1.c
@@ -2416,6 +2416,12 @@ static int rp1_clk_probe(struct platform_device *pdev)
 	clockman->onecell.num = asize;
 	hws = clockman->onecell.hws;
 
+	for (i = 0; i < asize; i++) {
+		desc = clk_desc_array[i];
+		if (desc)
+			desc->cached_rate = 0;
+	}
+
 	for (i = 0; i < asize; i++) {
 		desc = clk_desc_array[i];
 		if (desc && desc->clk_register && desc->data)
-- 
2.56.0


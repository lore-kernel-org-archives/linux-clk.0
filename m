Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172280;
	b=K99tGf1FHSaXRbkLhMY4UP9DEeLr/L2ngXbp2aogXpoubs9sVGbKbdu5PtO6/nDi98EY
	 ED5uCjPsfmswg7uQ9a6fZJwKFMDAxFQ2KK8KlANdBZqnDbsV1Y0U1NxgSnd62FRjN2Fcx
	 yDq/F5uiP0LdD8EeRFdTMvyLcxQdLgDYYDBBqNRqrsmv8u4CDsrmeHXmA8fgOqwGTcaig
	 xJMBg50/HciB470eaU2LypHtF4nWO74tqUX7bvhZkOfUMIkiJuPKkEIsvWWZBRmu3ZGQA
	 zt8rDiODKhtmfO9+OtsVRz7hyh1woBCJAKOBeIiwe4pNB1Ak+UPA8z+QF9W80zwZ2nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+aoykV8a18EfGjtngppAxydVm7TBp0whXeYggjz5TCk=;
	b=BicAtQ0mlhVrVP1+IJqt0bx7EukIdCkjAdz5YwLQuEC8yOjyW7LCiv4Ce9JKd2ASu7hc
	 A9HW+ODN9PE5YPPpRAarKRDG8xfHewgu3aaMmEoEP6sAMPPicVK6aLrZBKVwQuajHLJ8z
	 Xll7BzcqYQjSDdkEFExEtWMCW1/ZX/ob1GSPvIlOzJbsJO1kWI7H67InP9p2ZzYEBkFdN
	 RyRaiuuqNZtKHpC4aW+Vv6UcmQffGZ9w5WxDtTVlvLqR+T1iEr00MJKBVF5/JS8TcvAZw
	 /ISzm4uk/kYRh/BqSApZGVLKNeluRiHf7U+Fm6xSDBTckoqJ5SjTlfmWjj4l40KWDHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE6G4xkk;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEA1606A325
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEEA1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE6G4xkk
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38431138772so910429eec.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795172279; x=1795777079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+aoykV8a18EfGjtngppAxydVm7TBp0whXeYggjz5TCk=;
        b=rE6G4xkkji2r9kYKN5nQnw+VsKfRZChMrCGTQte+c1BeulUkraR4lcDONnXhWkgxKS
         SZKB4O5129hFm5Xh9LM3RRs9Jn3kx9EqK5+OZAuDgqUdrZzcjqADT9B4ZMqD0j3oZfF2
         TPPoefNvUVtawecIPTymy4S0LVuchFIMuPFraSMZCwU6y6cq8pWFt+pAYHOEb3Q7f5KM
         rkEA4FkHFyE0/68aMFCox9PRPRWjoVAFe7tBXFucYnha9Kw0l4wU/IvH/8QFMLvlw9Iz
         Wfhqo23HA6cZckg4AgZ2OwbAI6q3CFNXIZ5QoY3Sg9ylLDxevW/77Jw/piQZPpVBZOGw
         3dRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172279; x=1795777079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aoykV8a18EfGjtngppAxydVm7TBp0whXeYggjz5TCk=;
        b=0ie6i9WLzeByYDBi5MeS+Ch5Y59fMl2I7w/AQHAQt7wFtwLzYzanRry9qU4yxk7hAZ
         lbuKbIX54WOLMenMDB+9bwyDgZyttRy10wmKE0pSXycwpdpNrddsDwVhjuFLqeWiTWFd
         bRNychu92gy3qI+PUpExL52kx1hu95nAwH4Twd4cCfOSf95/xW4kj6uXsBRMe/y3kbbA
         of6y/ps6+gQGkBfxJ1KyvxOvVizSLbY0UU1AgX6YJgVC77weD7Q/ZvwW3qN7/UVaKy5u
         qkB/jONiFRu3eToPZP6XNs1+W3m5p08qqAOt3YCHc0WRiet5tSW+H0gyPjVETEZhEI0S
         GgGA==
X-Forwarded-Encrypted: i=1; AL+hErHerA9ELeCmdvjnSB0g7wvBsSy8Xbyx0yABF2tCQouk3EuQYV9jjnlxx71zLhMw09cBru6F7LWOb3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PTkDK0NFc3g8OeG/fKixMY5qhXm7mDzcfDD18ETIgKiB8esk1
	qhic17LdxsV5JiHdjTj+etjImSogMTkRfqy/uLlayBLTTC4WVngPzmXT
X-Gm-Gg: AZFdTZe/Nli/DFpI6FasNNKUtUd02W5Gjw0TkphZZ73GMpL7ojXYWZ5E+KxFseQrYw8
	rYfwsXy6xLz2Fmt2vwhLk9q3BJmgo1PSunc63sMNA4oGdC47LbrounQjN6escxLWasIfURWh+il
	NvWeiGs0Kdsa0BEYoo1oLDJ2Nh4U4ZxDvVcruj1dF7DtmtqSh9PCPXeyUx8IbtKK+2THzXgOyGE
	CSMBIN/pe3afr6RaCt2BAO1r3taRLZyqDpbD8d4E+gzX6TZqXjSo6JqIUnli7uuW8oS/2/PLxad
	f+igm7hwjSyxT2cOCgN3YRNbg61727MSrHIGGiR0mzoG14Dqmztwb3W44dnTC71SGn1rJThugm3
	K4UCQB9gXKXg9XgOvH0GcvsPFeddjurr0/hd6B36BE7Qw9TUvvCS/QKh2ip+ACpjdayoWS6ckwH
	DRecfbu8VL2/9DiXrOwFjQvik/tSjDKNGxGubUJZDN6P0X7grYc3PX27kekHN6PY/6tEZ2/2dL0
	fT9/bSXBhK6qvCRAMdRxoDXpLZ2WmI/Z3rVnoTl2NndfoaV5My8D1p+HJm85Dy57VlJxAi7puYP
	vSDQmh1cSB37hK7ETrifcJPLYKUsAux9pEU=
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr2596721eec.22.1795172278895;
        Fri, 20 Nov 2026 02:57:58 -0800 (PST)
Received: from ilotus-PC.8.8.8.8 ([113.172.110.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm6126602eec.25.2026.11.20.02.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:57:58 -0800 (PST)
From: Phuong Nguyen <ndp2809@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-clk@vger.kernel.org,
	sophgo@lists.linux.dev
Cc: Inochi Amaoto <inochiama@outlook.com>
Subject: [PATCH] clk: sophgo: cv1800: set mux parent in bypass_mux_set_parent()
Date: Fri, 20 Nov 2026 17:57:33 +0700
Message-ID: <20261120105737.7461-1-ndp2809@gmail.com>
X-Mailer: git-send-email 2.43.0
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

In bypass_mux_set_parent(), when index > 0, clearing the bypass bit
switches the clock to the mux path without updating the mux selector.
As a result, the hardware mux remains at parent 0 instead of selecting
the requested parent.

Call mux_set_parent(hw, index - 1) before clearing the bypass bit to
configure the mux selector before switching to the mux path.

Fixes: 80fd61ec4612 ("clk: sophgo: Add clock support for CV1800 SoC")
Signed-off-by: Phuong Nguyen <ndp2809@gmail.com>
---
 drivers/clk/sophgo/clk-cv18xx-ip.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/sophgo/clk-cv18xx-ip.c b/drivers/clk/sophgo/clk-cv18xx-ip.c
index e936e3154003..34062ad7f2aa 100644
--- a/drivers/clk/sophgo/clk-cv18xx-ip.c
+++ b/drivers/clk/sophgo/clk-cv18xx-ip.c
@@ -588,10 +588,15 @@ static u8 bypass_mux_get_parent(struct clk_hw *hw)
 static int bypass_mux_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct cv1800_clk_bypass_mux *mux = hw_to_cv1800_clk_bypass_mux(hw);
+	int ret;
 
 	if (index == 0)
 		return cv1800_clk_setbit(&mux->mux.common, &mux->bypass);
 
+	ret = mux_set_parent(hw, index - 1);
+	if (ret)
+		return ret;
+
 	return cv1800_clk_clearbit(&mux->mux.common, &mux->bypass);
 }
 
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890941;
	b=1PPzRlmTAC6SYDn8nvX6y5BT7jGJbDP9p1suoHsQ8K28IbQhp+k0J9NOsDr65lIw4atb
	 G4Dj/AXIHts+JEaXV06v2LSOc+soc9C9sAU1d67oU41Cg00hCHNKGjcAVIcODpwj5DHaa
	 eYwMUKbyS9GS9Iani+aaTWaXbv9QR575h7bLbMu112w1s2qboHI1Ot0RPXSrkY/w9VwW3
	 PGXQ0NsJd3QPyIl5FNctfGzjMatkxSXdq625HcJGJxK36vaA13Hv9BkvZnCSk2cd+GTFp
	 zdy6qwtUn0epy2rboDQeoUZS+nPtqGSGQoj8y2F+fFxv7MRI79Fn9sRSKzeEvl28wHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5XXfNWmUTdQwwlPTsJIdH+pEsp8jvzlkLP6kkxV9f6w=;
	b=k1rQuaYgFyIAmlm4bTRrNw+eVCVVz8Q/5RIGX2SqghLdaI0LtVRGI91igkeRhpWzDik9
	 yVbY4IOICLN+05kgzj1ou4xqXXadMSY1DC12TXapp33UTPbf+WTyISMP8dd1jkHkYgoR1
	 9vahm7auO+f19G6aJfmocMBF8EOtcNnwALNHfpsSrjl3HwTZZ+tIdu/srNagewcf1E1xw
	 s36uRZq8/5LN761BGDB1cbGS85PtVuE5Aw3q6bComal9K+ZtuSZePix8YpSjoejJ5msK3
	 diqNUYykvd/bq3tspEFhpEUdZRkLhdGFvvyFrwqa7xWvqLEJlCVGAPd95vp7/6dzo+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ytKq9M/f";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C82F606A339
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 15:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C82F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytKq9M/f
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4922dbcee23so170462f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 07:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890939; x=1794495739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5XXfNWmUTdQwwlPTsJIdH+pEsp8jvzlkLP6kkxV9f6w=;
        b=ytKq9M/fQJibzBL1ikjVi8O60EPDMuZmD5vX7jCbFWq7L/oRNpFdLQNzvuWvhVd90X
         N/YLCUCJ2OYpB/RLWFN2+qnKoEv/kBtaB7d8gEKwFIdOugpxEcOrgTSK/ZuHfwJnuNJA
         1vV5evgrd/ZrNLzrFBQO/+74q3slAfoPyb73lz5RzDPfYfy6uk5eRc8HvS6+NszgFQFo
         nx30fiAesFQEtLdz2sC7anOi93gMxP88nX9Wqdi24bGNBeXI0UMzj6HkEJl+6k17Q4t2
         1sjFWaanmIL+1hoVxqMilcHJfXXDnhXwmJlXEAtpt7vHYEt5GeAWSO5aJYyp05EQonPs
         oBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890939; x=1794495739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XXfNWmUTdQwwlPTsJIdH+pEsp8jvzlkLP6kkxV9f6w=;
        b=dlD2imGEXQm3ha5pqn4HGNe1DTxiYzttWwkV5D9zIrQKG+/I4rSO8QNwWxv0kW8Jlj
         KtoIT9CwqE8nlZ1pp6ANLjEpkg+9O2daGjAkoupUrea4Z0iQBwU0JPzLGWt5U/CwiAFg
         fnhoSrwWR32JAqVt6aSfyhDox2b8pHazsKXNwTR4B0GrM2p450jFU8yhgxBmpySvZpJD
         Kcf91+jF8g/NKbm5omtgqwT1R8YBAQR+0kw3z6Cp8dlzMdUzagq5zfc7+Yj+tIDymv4t
         s7EU8Y6gyUrn13jc593LY0BlXVGSVuwsBrSbyAIA1SNdHAZk7hnDtlxJhj+gP7E2nK6s
         WIjg==
X-Forwarded-Encrypted: i=1; AKwUvByLDVK7FW+jwht/Nr4wpGbB5uoSTEw9IiEqq28MLn9Z9mKFMAiW6YKND7YDS2ZdC7+wMS53QpEvxF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Lo41jD0BOqaoxdtftn225506+b1VCyxrcpT3XGYwW22wGZt8g
	MrWtD5TUFj1Xwgv4OyKblBvm1KmdRDEADQYpNo/t+zw5ZeZ7j4XglZaq
X-Gm-Gg: AYBFou0TBzK06U82RgneuayU+14WMz1ledjTtdLp3ZoIA1+iilw6fzKT6q/YjImiWYl
	smSHVT6SOQQmI7nr3NhH8PtQx67j+/NCFrb/djbWzeVfTIzMOrWrwr8IGFBY6FtoRWrD3gG0hrJ
	BZM0+HLf8wvQJurlQukfQgugS4En8U9lE0yBPBzdfoIHJoGKPRZ8CTObFazgQdGEdw1WhIWaJr/
	YhJjVx0ozYIUc63KLERUy9bBgnaw1M2CCob+rr/YmT17GEqEqqW2HfAsv3nPeJ2o4vNMXDVoUYQ
	u5xULAbhAOyHHETWmRaF/UUeamkCadRzyrLstwrgb1ZN7TgwoVK/EwqJAVT/i5ibGf8YameiWA8
	A5cVvX9bJX/NpJBf4qFeV5hrDzo3YjarKMAn+3GVYFiESqVu03n1jEmLZFc2JtchvX+HgBZUAOR
	ZV43+A/0zn06RerqICFK1EzkYYL9Bs5gw3JUROFqebutMb9UL1+NRTvxV4apl8ZhGWzNYAFZGH5
	5TbDpsW2QAx7kLf4AlXw8V7X2EVfw/YEQ2LFMyCRj5XjcqI+mQ66OSwWfFbdjlQiUE6kz6a0rpI
	+q4VDv25nF9DHh6ZOL0ySmF9aZkFBkVQfq1p5w1K48pu5uGp9iY7szLWgGUz+FQYYRmHoQqrs72
	xo5A+MEBWobrYb6ivfCt3lmilBjwNIFNOp1of1iLmtV28Gw==
X-Received: by 2002:a05:6000:29d6:b0:48e:6f76:de98 with SMTP id ffacd0b85a97d-48e6f76f49bmr26301083f8f.9.1793890938744;
        Thu, 05 Nov 2026 07:02:18 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fed552aaesm11042960f8f.40.2026.11.05.07.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:02:15 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 0/2] clk: en7523: full clk_hw + set_rate for en7581
Date: Thu,  5 Nov 2026 16:02:04 +0100
Message-ID: <20261105150207.23023-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This simple patch convert the en7523 clk for EN7581
to full clk and adds the .set_rate OPs.

Needed mostly to configure MDC clk rate.

This will be also implemented by AN7583 since they share the
same exact implementation.

Changes v3:
- Rework to clock divisor API
- Return error instead of -EINVAL
- Use dev_err where possible
- Use devm_kzalloc_obj
- Revert to not fail on clk registration failure

Changes v2:
- Fix recalc_rate return value on error

Christian Marangi (2):
  clk: en7523: convert to full clk_hw implementation for en7581
  clk: en7523: add support for .set_rate for en7581

 drivers/clk/clk-en7523.c | 280 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 260 insertions(+), 20 deletions(-)

-- 
2.55.0


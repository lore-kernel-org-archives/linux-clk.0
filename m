Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581850;
	b=aw4AkdOWupCVI6UdasFW8U1VQQuLuzrFcqdPQdIYCBK+MFYx4zAmhOuUEcfWytoYGJKN
	 DwHH+5yd7f4maualnnN0hhOAqT0I0LzsMcbnP88l0r/oWvGcjiyeagYqI36ko9cqxqBBb
	 NBwajB9M7SkSG0E//KUdVAl7OGidbLr1RIGjSTeZaCaeE4yqJeewH0Grc/NVCArKF49iy
	 upNO9bHoE+oFCVuczy2Ljb00dV61pm96p16Eg8Dpafp2FDeEW9/ugrcvXr5g3RK8+gtmO
	 1KOgIShduoDDQ17vJcDgJG1aRC3TSscdLWCU9W+tb7JMm98w4XKxdvSHuDfero5YXPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lZnQS5vzjGFgkIk1Rz40qxA1rsbMTGKx4DvpvdhHSZU=;
	b=z9b7JeKt0PtSEcBq8ELfoy+HXiodGItTvqYlnN8xGVvPQ8S1R0aZwo9IxYPVpLsYHONg
	 JMS7+faVF6MLN5HOoUjWGYyk3AxM5Og5jLKJT9B2q26mZjut0wLVnt/UXhkf8pDqv2wu0
	 Kr3f6ojH/U+s6bnqu33m9ZS+ZkZx+WamAQ4eiMHM+kqFTsqTnMiZmjDlsqwf5mONgBLqE
	 IeQdW/U3ttge0BRqrXQMQJ7P5EY2Xsdna7pqpyCesfwkg0XMN6qxHZAK+pnwBbv43pOzh
	 mlMCtr+KEX5v3bhgaMQiCKYX/QsEfC1nnnw7P0d2vDWT93OxrGkwr/3hqREHEaNPv0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K9CSmkJY;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CE5606A33A
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 14:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4CE5606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K9CSmkJY
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c5080ef9b31so229408266b.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 06:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794581848; x=1795186648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZnQS5vzjGFgkIk1Rz40qxA1rsbMTGKx4DvpvdhHSZU=;
        b=K9CSmkJYNmtAbvWCYPrP+SDpZMQQ0xdsPYXo8PsLi7q0i7Is28YK2oObjdZIdIT9Hy
         oUZeGt2AyBbZItYfe9wK+vYDeM1J8WQInwUA6ANAfPmVZ6W3eHYOh2uFtetiapb8VA7z
         2hJQEzbUki2GkUe54rvHxcY47jRM7YZ9kawcYDZpTB1ajp4LEuTAmkgk6NQg2C0JRwhT
         FJuYRGnfvm0iGRi94tXz55orMhZs2oscRwq261Ud/F+R9cedJFud5B4MJ3u8ZUVekYRC
         XXw54HRwFyv2zeglylezSoT/W0SPhglx0UvxuGoBYFkIqAwretjToNI1b3jjRZTQzKP5
         Wdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581848; x=1795186648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZnQS5vzjGFgkIk1Rz40qxA1rsbMTGKx4DvpvdhHSZU=;
        b=T0IioQoZsC0cI6Ql8icZHuVCYIq4QLJraenLlFyazlYTr0g/rs20gfHy2iQhfLdfU1
         8Bv5B52KuzymRCOUvhrrFysu1rlsILX//IMLyhq/R4PRMY6ou1FdqJozXb+yP8kD1Fep
         mVK7g/BJ07zLH3m4SsHDZ4O/53+gDBI6ZFyrCjxDQKIPcpRZQuLacXvtdI3fQzCku96H
         ng3QLJUEGbfioe1ang5YgxhWZ2Lwd8hiPWXnuqN9Jq9Auki3L66CWr2IDmsXSrS6EIDe
         Klt2Xvw4jp0+8dfP1aEYH1QsKdFpEqtEW1+FBodBYpr5rt1PlhV0PZ5pcOdxVycKYHu+
         I/0Q==
X-Gm-Message-State: APuU4Z9tH9tuxoI8ij7CCxkZyxDlAbgZtFuNxD/fI3fIdQfaw3+dWLpC
	1t5AkRUdwz4O3CAIuZocK3TTS5aelROKaqcEEryQQMagZAzsm9B6kTVP
X-Gm-Gg: AYBFou0YakLtbUWy+BqvAeZkwK0qoDqX/R578ZBSlRjAni3BmEagIDs44pcKDYT2sT4
	ikcucHBlrrM19OCZD+cjG0RLErl77/q1mo/7m04begxDCQc4m47y5Bmwp+GtYAMJm+lGtS6Egvp
	KgmuH5dXdjqcGMCb/aOF9GKuOi8A7sWXgESF6um1i/6CVfICMh0wvNLvGLWGAg9AUrWQlyBGRqJ
	1fLimtaelon0MdEaF3rq8i3hquzxOaTbzDWps0O8dp0LLTMSMNMGEECAO0bGuSxlg8e7jAXpFKP
	0Aj639irHfGTGNmkOs1d6hPjQsBpUH8zaEAIfqcUxM9USjXWTHNEGkpVay0h8a1qujQypbzOrKX
	+85xS8Tjnpxtui4BpGVxI3xNrkGLIwlL4iWDgxKVmiTfHK8laQrd+iBZSAnUjM7JoOxrQJij+2k
	XsfLvFBLq5OLtf3hfrrQL1NT2ffwmyBdEhR5KALqmoK+lAuDI3N8uiBIUM0L1Z/2AyNxaSAsxfG
	YlSQ1QYs7zvpE14y5GpJCd8Dfjd3thEoWg0IyDUNenRmZVLMhVq+W3EWltiH0wUib3HX25TJOFt
	gTVczDXUXFRVDoe/a4ELmztuP1u7q2+v8Y3yrUYK5K33DsCH/N293njTWWmFnyn60AJm9ROyRwn
	3WnsvzaxZIwnuxqQofgZlnQt4O3Gk7PYW
X-Received: by 2002:a17:907:3d51:b0:c34:c5e8:1dc5 with SMTP id a640c23a62f3a-c5096312247mr256633166b.20.1794581848001;
        Fri, 13 Nov 2026 06:57:28 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b2369asm109937066b.25.2026.11.13.06.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:57:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 0/2] clk: tegra114: Add CSI pad clock gates
Date: Fri, 13 Nov 2026 16:57:06 +0200
Message-ID: <20261113145708.261530-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively.

This change is similar to Tegra30 pad clocks and is required for CSI block.

Svyatoslav Ryhel (2):
  dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
  clk: tegra114: Add CSI pad clock gates

 drivers/clk/tegra/clk-tegra114.c         | 11 +++++++++++
 include/dt-bindings/clock/tegra114-car.h |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.53.0


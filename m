Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021396;
	b=s8b3Td7XHcSPqvuwxJCmKA5E4gNn0vZE5UqBupE/iygAfGsK1RSWDOD2eIZUM8Zd+LmR
	 sUZ9XZ7RayugdPh4N37aYKqFbJckN1jV1qRVsik2ucVDllZpDymeih09tC1Oe4Rbdlhms
	 xdwcxkGPprCHlqs0831hZY39uvsqCa/OVNQNnS8b27X7j2fVXjwI/QMVABEFmwlrB1gw8
	 /5WgjZmL6D3L7XKM68kqMxTnTtJpi6xz2pWwCto6uok1Tj+zNykVYzV9vs8DGbUq7E7AF
	 vHB3VVMUhHPdrH5OwiFoYgeT+spWTAFGUxGrAEgbHciEvjav7yYkQYatfTYjG8YpKhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=+8H3O6quflUjqnAfb6xhcXaxZg/Y3GPcBLpYGFoqzbM=;
	b=0vvvsnjntKcAxteeLyN7Dvop/tQMsfzLlEY8eeX4aKLooyuQR3tcybrwles4oXd2YbqZ
	 cZxSygEFoT+aJbxVQ0w84SBJZ30pqS64cPMW0X7TiI3IgzZZpx1BBsDehak+tP6x3C6ny
	 eJTOnLg+FDFpocGt74lfNOoFGpLH/RpAayJYRrTo0yze8JTyPIt7a/OdCEabP+GXBOPJ+
	 hGU3ET9J8hjA6YUEcVGPnTaN4XuEu1UWzWg1Xp8FWldTxc2XkxYD8HD6cf4KP6evQLvXv
	 n3c41ernX/Heid+YozJEsYzmP/2LL8TlZykVD16Q+UgKjhsiSfAX183tbm6lzZPWO+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mkWnB004;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CF5606A31E
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 13:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2CF5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mkWnB004
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so19569415e9.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793021393; x=1793626193; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+8H3O6quflUjqnAfb6xhcXaxZg/Y3GPcBLpYGFoqzbM=;
        b=mkWnB004RlPg74PYFUh2tTt5NpYjKdrGeCAQaj7PHkLTmly/tXgRUMdoL0rbvSYRBl
         M4+0H+sAkY05Lm5cXHNAMt5fNYfLfpFvidaG7PUVyu3DMQrMjU6tEC0NpBL5ARPMv7Ko
         qETOh16A+rTpCbtYiPF0AXbE0R2Fm7FWCOxNIxxKR05ArcnX70DlM3b2vkWEEiOZvKR0
         Ac/J76/OZH0+z/OIuYnkPmCJluuSn6ActgcovWxHYA9apBvKt2XdMy70sX6/eda5aJ0Z
         iTwYmnUbL78hXpaoeMyvnyFg3On6HuZ4ZtuR5DgkqfbAay1elIKAnfPxHvuYU2EPF0+l
         pVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021393; x=1793626193;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+8H3O6quflUjqnAfb6xhcXaxZg/Y3GPcBLpYGFoqzbM=;
        b=EEJhjmgWMsTfeUQslr1uJtV8Ea6pDdmS1LAvS5HygJm9Wj+9xOEUfI3T+Y3amQB0OI
         JB6yBPn4EnwLQsrB0RRjq0pjadvOudvlsVcSEB0trqnLuF/eI3X1S/wvwJFem9UdsSuU
         5ktaxo07kemltSvJHjANuC/LFDlBjHFtvxzmaAZZjCldi09Mdv8TJ2a8p8rDRzUVPqg5
         TTkF6ZaPKBuGs0JF/ydgFS1q2Kx0TZu8WYCna8AvjwZcFIudCeByaXBQSfo5wyIowwAE
         NOG+SoVkqq/SN1VN1bLBw8C9QkggTKkbIH7fo6SKr/IuSkSQWEPt2/Wn7tOAO7s5AulW
         qX7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwTIeSgusKJi/JWMCgHlcKOaG3KlOWhrGSxGef9hNLSVWXSqGfnIDKQYDva5STH9Y2s3bATB2gSz4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHVDMinRDc7TCYHU2a3vmxIxBNMm5GUZgwYzqTdtxzaYhaAZmH
	dJp4/7Bl+JvFQcUpPI/B8OV+cWySkDdfShdPMiASV1FPGNiadquQXB8O3mf8RLOX4yi40lZsq/D
	QHPhO
X-Gm-Gg: AYBFou0jAhprlv6AqEvEfLR5KYJMxdC6ibkCeFSzUHm5uNqrrtKwyZ8oDg1r0n0FXxt
	8N7W96waPW8mWtvgWgy2PsegNxldgbCC3tC4yufYurKOPiZ2BWI61bJuiwaiYIHG9vaDX6YEOBr
	apdiof5WACPJf7ercIMXv12hmE4B5QZQ3OxtYIUFhvRD4avT+Bjt743rZe8ghkFBo4igQmuNXfc
	1NrvM7hhm9mxrk9ZhKk4Ij2ETYQSSUAdwx/7HErKiM/MlMkYM/nss+WzmlQvVIuAdthCH4g05HU
	+h27g11xnYb984OHQ3xgfnXNEFFYVsSwJnuDulmAtD6uajLmSgKT8dQWn4gMEv3xmTe/aLWN143
	n3yjcMXeJpzgQZWKfkRfQTEq0lWwdfNapKCKTj4DsMTa0Fb91gog/aDRb+0mDEa6PMhntS1c98+
	qhQGx6GO4U012IPLpXI6yzSoDqO1i3tThrwWYuQK8nTs09XZqCGsxfrxSwD0ZRtnXas8d0iMkzi
	6/RGeK8cClujy8QCJNwMxCRGuKLN0wEs9cXviBQSjRDxdhc5VmInZIK0jaxX7gRCBZxBF3/zpqV
	XOqQM3Sn9r6TzK489zpb6yQmi9Zprf4NA4xGFrZxOD/l/LYh7NV0Ssi50yKhr939BvsU7+Pc
X-Received: by 2002:a05:600c:8b63:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4a35ae7027emr137803465e9.4.1793021393144;
        Mon, 26 Oct 2026 06:29:53 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm194507095e9.0.2026.10.26.06.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:29:52 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/2] Fix rate rounding for Meson read-only dividers
Date: Mon, 26 Oct 2026 14:29:43 +0100
Message-Id: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQ6CMBCE4Vche3YTW6KJvorxUNoprgo0WyAkh
 He3yGEO3+WflTJUkOleraSYJcvQF5hTRf7l+hYsoZjs2V5NGU8pjwrXsf9+WNF2LrEOHGSWAOV
 4A+pLbWMDQyWSFFGW/8HjeThPzRt+3Ku0bT81nJl3ggAAAA==
X-Change-ID: 20261026-upstream-clk-regmap-ro-divider-f9ee3532fbe1
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

Meson read-only dividers can round a requested rate using a divisor they
cannot program. The clock core may then adjust child clocks using the
wrong parent rate.

This series uses the divisor already set in hardware. The first patch
adds a missing /4 entry to the GXL and G12A HDMI divider tables so that
all their register values can be read correctly.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Carlo Caione (2):
      clk: meson: add the missing HDMI divider /4 alias
      clk: meson: regmap: use the current divisor for read-only clocks

 drivers/clk/meson/clk-regmap.c | 34 +++++++++++++++++++++-------------
 drivers/clk/meson/g12a.c       |  3 ++-
 drivers/clk/meson/gxbb.c       |  3 ++-
 3 files changed, 25 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-clk-regmap-ro-divider-f9ee3532fbe1

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


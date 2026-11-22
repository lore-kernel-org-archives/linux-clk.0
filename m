Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795346680;
	b=q4be355dMOcAxCBARUOQu6+ykxxh81tyrNlY/2WJ8Sdyrm7TT5x0BIEe3GylAxo0Oytu
	 dwAQ7C8xFZ48agwk3uyEKAxIz8V1VghLlNwisoYqVO24KrCFzARY+tvNKHEDuNZ0W8/MU
	 WbVP2jSRmbNfH9TH7wqVbJOMKJCfmcLKmSxlkQyTdTW7JbEo+6CgXVtMmfCClidI8KGO0
	 TJRmPjQrNnGcai3LW0o7D+vCxrBu9uX0y6BFLf5IusNbbyqyTLBf9KOzyjag1ydpO8ZxB
	 pGxs6UTI5fhEYbK7KlRVrgFDVr9NHP2nlR3FWmArRUE7Yt+5tXEl8ED/AwsEI9QeRXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795346680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PIMZs/Htwz82mADxinMvXjHajQn3cdihqcbSr2PzE2k=;
	b=CZdozxNuLy1YyHwYl7zn6sgNS9lS62E250OMXI1eGHR+0WRejk0B/C1rPSdm9emF3fZX
	 ile4/WVLFRSmnq8A47cnKcmG2PNzN6SAAM9CA9Ki4EFr7eYHG0URqwiv4nZgtixTPD63n
	 cxcgGo2m4PZYS1t0SlJI0qiO6/7lQYCWGK/d2P2DE5mge/ZKOBKQI+lVpFk/9WSPyXHAa
	 jtsXOpuIilmRwHRhOAUujQDrpUEiaW0YhG4YOPV5Cd0uLpliFYEkRGQtZ/ziERdk7hwPj
	 lrj1mRELb/PuV1kf3jDBvTGyuDF2h7JbjMxvNMTPgYgy2hDL5fezXU84Yjq8zZRlCyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MTyvykDS;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59725606A32A
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 11:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59725606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MTyvykDS
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b467581b98so21127085e9.0
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 03:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795346677; x=1795951477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PIMZs/Htwz82mADxinMvXjHajQn3cdihqcbSr2PzE2k=;
        b=MTyvykDSqxZixMQAjWAYp9+6EHQ3fkdc6x5B7TVViGYLOaE0Tx38aXRXFuHu9ZCvKa
         uPVaSRpqyFGKWyiWxINiHm5iPYP8OSR6dh3DZm+AdJflyqBb/kppkBiN77p2Ok9YhUdE
         y8lt98Yjz8KZEFLSj+MoTqoITqseG0wrl3OrIMifzGbRyM9fLYkNtpeQP+0CcbuTa+L+
         TW0iZ6bxoOfqcWd7inFXovHIoEoJ1azO/rH469vv0dfMcGK7ZeDwCPZmizSWFf3xdhl/
         w0xx7b4fuObM8Sl7yFSl2x5cuyo59JTYwh7FaVWnC1+MuFv4u1h9NTrKteJCFl1BxSWF
         FMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795346677; x=1795951477;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PIMZs/Htwz82mADxinMvXjHajQn3cdihqcbSr2PzE2k=;
        b=ZuvXaWFXEdzto4d1dmBdEDRAtFsqGHAY71IvKN0Rvqi3rOyj5lyxHjpFwx04psN2QK
         iHnHFSuROEu3+ayRMqEi1ljbLLo8IPBiDNp0ST+l7z0wkywLuRx3ZKwKpcvUIQyf9wHH
         dZ2DjpoyJxnQPLp9LeBZ4M9oT6Gr9IxdHN0qmNVVbYYdDuuMOqmJZShr87mhecX8zAic
         amGWlP+VHYUafxxn0laIvrgfwE+gvn/dsmvu+NMBIRUmknd7ajMnKjkjCW2lWxKyiBwx
         o4a7Jqt+zerDdSggu8gdSUYfOVwXJl5/tF3OTxnsAEyC4np4f3QMgi8efK8opgcKl1JG
         6jHg==
X-Forwarded-Encrypted: i=1; AL+hErFXyUrZOuY55qbXY9uU7W0m2S2BOpIwNQcgichwxcLDQWJp1oOYqBgky+6kHDsfnsl73UrTsZM48vU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9flKKkWtqcL+Qs3LFgpfrg8VZi4I9diKaln8lCWdnty8vjvuT4
	JjEUqGoEBpbQEPAKJbC8GRuxYerLYAOHSQVpmcGbtcGuoQNAgBEcc+7nzk2//1XZqok=
X-Gm-Gg: AZFdTZcnPgErZ7WyQiiRP1JGDUWkpTkkVAgAs22M8lH8G/uxKYekOnk8J/nbeT+r+Iv
	DMQDYJtsWCdmXIXS7SVMCKfta/t5ipE8gStXoXEFPJdwGUMczxOju90t+gaV7JMQ4gHFRGH7UkV
	MJ4Dw4u/1sA/TvsX0hUQbW2dNT8cxKrrXt4cynxnsyyTQeof3fQ6Z+ZBShnR/mNfgzVRz8ynWbP
	NbH15jsQFJk7gYUbT6b+OZAL/pLkieAEvXvknru7/LB7gpa+dk4HQWa2JwU2IfpilyE093x5hUD
	7X7fJ1RQLIOIeOs9WbcpXlj3q+E9KdVXvEX6FQwbcqaqPk3FjQmcks9EjrgQOV04pppXL3+Un/Q
	HOp69hSHdoWWPJiViKNJhxwiH/bhkBpG9PoU4ZMwIXSChUS7Pp4kztUA/gXRSSQfLrttDPF36iM
	YzK0ejxaSySDXZ8oWaZH27LBaR/RpprCQhbBGOTqZK6/VpnOEGz5dceq2bYmuJPLd3kWT5nt2+s
	DQ0NACo75h2/f+9NVGjmOaFRKz1t/GdgfGn5FLDLEEXepLmRsxOnvZuJN5XsC9uNR/iV3m4EEdm
	/p1ChfFWtp2EUkYiAq3sbsZBPeNVsFSauPzuSOhR1vXHUkK/vQEUI7UNyzyZNfXIv0/t+Q==
X-Received: by 2002:a05:600c:674b:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb8892c0fcmr168170325e9.20.1795346676887;
        Sun, 22 Nov 2026 03:24:36 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm102621925e9.1.2026.11.22.03.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:24:36 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org, 
 sophgo@lists.linux.dev, Phuong Nguyen <ndp2809@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>
In-Reply-To: <20261120105737.7461-1-ndp2809@gmail.com>
References: <20261120105737.7461-1-ndp2809@gmail.com>
Subject: Re: [PATCH] clk: sophgo: cv1800: set mux parent in
 bypass_mux_set_parent()
Message-Id: <179534666693.2640804.5201937916050830729.b4-ty@b4>
Date: Sun, 22 Nov 2026 12:24:26 +0100
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=202; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vTA6qGN6XffHkpfMEVingfg19fsOSrdJk4v8QOjxzCM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNlMF95OMnGysTxwfl789Gq19WemyZsH55+VsGuL/xPNq
 SKZLP6/o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABNJ2s3wi1nl8oL62UzZj5Vr
 JnT+fhX58WaL/ZT9Yq8sHoRU7t/yM5Phf7JDvOsrq+wNJxr+9n9/Yntu2/GJRg1FB0xEpqjPvM3
 xkRkA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to local tree (clk-sophgo), thanks!

[1/1] clk: sophgo: cv1800: set mux parent in bypass_mux_set_parent()
      commit: 2c6c86e016e6b4394c4de23891423cfe65ba8d43

Best regards,
--
Jerome


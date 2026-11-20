Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200280;
	b=Ke6nZKYa50uZ9q2zXL7KUn14pFYErCs8M8Mi57Pz28BX/w/ZVwlyQc8s7t+ac5un+F9F
	 iR8NWc7ehgcvea9hvdvd4rf9Am95wwI3QSgnChn7PQ1vckXb6aWzrdkq8HMO/9qxwyHL1
	 HfR3jK7uQT3JqVVWQDi3UW/1bMA7wYFcmwHquQZIeguHBmVCSDpu2PYWsT65G8jFA0ERs
	 GrMm9ZgmLQvtSP/6i6Vn8ISkXmfs1E37A6etQRw+eot57qRyVKlu0SFEblsIsCsyH28Bx
	 0nTVTtI8J60JVfjqbL6L9vqan20LhEPnXWSTbJLnjtaZukJBqeQb+BwYxqejQdmIz8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dbpUNDPZHadAmYIMfmFFaoO28ERPlPd7k31Pt+FAz5o=;
	b=LVAhtFp7zXysECgvpf3AVZPL4ZiaBLuQ0LMBhwCFu1nUUOqps/OY98f2eFIO7s+YiThO
	 IfJkE4vtppizKrmJBySyqx8tn/wtPQ7zAuqW+s4Rp6jNSRVO4g5prU851qtSSkVQh3GJL
	 u2/8Yj3yn2ibFQdryPMeV1tpOMueCQ79uWcqfQ5PzooFYPuXQDCpE1UL46o1uskGeNfYA
	 8kB3k6Hqr1LxtKC9YlOMXwRVPws+o/rg0SnefnQj06tx4JDQeT4ULc8zjFJf67ozz5jXK
	 5SZgeMP7CO5mAxjSpZUfRwwdNsAxq9eFE+pWwkPINEOkynoMh7cyhzc/iYuZ34sK/iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DvBSyLQo;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A318060A261F
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 18:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A318060A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DvBSyLQo
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a9be758734so805762f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795200277; x=1795805077; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dbpUNDPZHadAmYIMfmFFaoO28ERPlPd7k31Pt+FAz5o=;
        b=DvBSyLQotzWHFDIGGvKvhH8h++nlxGbcyyVD4QhOQ5wcc3u0rf8mXGe4I+ezPvFPyP
         Tbpca1Pa7al/R2fEdLzhkD6PrJe6GFEJliMiB356iXmBYd/k+Rylid3GXQgcAjFU03Gz
         uD5fgCm4o8wdXRU8KuLy6hDnHeBRvOtCx5VzbCYpU1aHBaCYy3AcGF1QAa3FHpY69032
         7pX6K4Lgf8krWPDHJXt7vz94yoMDYb6yFKlgWQmCBf/Y+WrHKleviptB6UM/63NKF46B
         lzL1k5arhA51GRsYvTBmnPJFt9TseY7iOfqfiRMJ03c2R5wjoawe7c5iRY57fARgqvdU
         HovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200277; x=1795805077;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dbpUNDPZHadAmYIMfmFFaoO28ERPlPd7k31Pt+FAz5o=;
        b=jUc5ckXo1lPj/Scb8fpqQ5cFWBWBpld+WjZdHgM6o1bBO1BWbCy69NAI3Hs2xdP0rI
         UtvqA6d4AAXKwDhbYeUynLZyMBYnnUfq3bucWwlxuMOl+eO2p4D1LrMXSfcnaCj/JcFE
         Of5SjZpWYWOlyjTPnDb/eRDFoTJ/LhsLKxHMZ4dVF5tjY7xWI45rjUhfhCoEYzk95nQW
         P3r3TxXvm6FKIAIl0YoBf2+Sg+J14Ie7ddS8xCTb0XWLOfdb2qnknNR21WccwvXXexuX
         c29V+Y/J8d8z9ey9nTTXnwHlyPMwevJsx9R9vZZAsb4RwNKO7u4ePZhSAUrrJLnw8Fjq
         Qwuw==
X-Forwarded-Encrypted: i=1; AL+hErFv6eB/AxePwx0BMvFRPIMB/l7zpDTDZrePqacCRK6K5atI4deFp+pxDqPEZm9sYiKRI6KkC0RUud0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3mEi/KXFyn38bZudAkAlzla4TyEPqWtfz0FM05o+sQTKUxmbF
	SouJA71pRJjsN3QoWGKkXiwJm805hzM8hF+xTYuLTaCIsQoQgRojg699g+9UYcM1YhM=
X-Gm-Gg: AZFdTZdEG0zr9SNmTURK9naRlSbMfprwTtqOpX9iHyIKEY/xuGkwDOsL0Wzb51mdMGe
	SOcUUJhv4iU39nGSa+QH+R+D9U37lmTYIYaWq7e5Gag9UuBpr+bIhLH/k8AlHt+ij+ylqejzEw4
	z2LzaFrY/ZNqWlDRUKRWNwCF9UabBDAXMxzLXDCbu7v/1NEGoWzbVubLbuAeAUZC64xY5Rcpq6i
	/7oXsMJUle9G/USwRBzN4YKbt90uxwLHG8Uee/yjpxPJN1O5GwIETc4ddn1R0MyRpxkRhi2Xucr
	Uf2ekY9nsxU+S8vw2BUV+L3sgoc3A1lxa+dA9H5Dh8oxwrFQ0ZOk85QO/iQ/hXrTlml0xPAXgzZ
	lCcdtFRRt/VLoaT6gRkAJx+oHIVeTnAfuZR9xGd/JM99McOh8msaB1UogYWfX3o7fVjf7H3E1S8
	WK17bJUolDihOS+MVRb+Ti66BjsVLSkJLXbEWpbr7+YtLFmW1p9HXm9vqH7sbJcRnJ5jh955Cqv
	5Y3/YdpXChohi+nIptGuRuMGYDUVAXbClU+DtXvpvFdnSJsztJhy+/s8t2hGprgU4eOamnymiAZ
	nPR5CkLo8eLKyOCFPC2nHD4jIOyroOvwhS9TyAykHQG2ia6a
X-Received: by 2002:a5d:6691:0:b0:4a6:c3f:9d0e with SMTP id ffacd0b85a97d-4abb3d2c0bemr5838892f8f.44.1795200277031;
        Fri, 20 Nov 2026 10:44:37 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm7999128f8f.24.2026.11.20.10.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:44:36 -0800 (PST)
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
Subject: Re: [PATCH] clk: sophgo: cv1800: set mux parent in
 bypass_mux_set_parent()
From: Jerome Brunet <jbrunet@baylibre.com>
To: Phuong Nguyen <ndp2809@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org, 
 sophgo@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261120105737.7461-1-ndp2809@gmail.com>
References: <20261120105737.7461-1-ndp2809@gmail.com>
Date: Fri, 20 Nov 2026 19:44:34 +0100
Message-Id: <179520027402.3795820.10625849754833863467.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=542; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=eYRKSzuppIIPsVALhR3By5BFF1H2aR0BnquIko5QzAY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMU4U3Hp2+zfeUxPVfFT9DCubkvvgZvIoneHLQgoWVu
 9MLbXf5dpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAi9tEMv5i1dNcrNVy+u1qq
 vWDC77kxUnMSZvdd5HG59dyL59s9ZmaGv/IBl2sXVJ+ttOPb7Xv00dqkq+duOxQnJ3WrhvhMqc3
 p4QIA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Fri, 20 Nov 2026 17:57:33 +0700, Phuong Nguyen <ndp2809@gmail.com> wrote:
> In bypass_mux_set_parent(), when index > 0, clearing the bypass bit
> switches the clock to the mux path without updating the mux selector.
> As a result, the hardware mux remains at parent 0 instead of selecting
> the requested parent.
> 
> Call mux_set_parent(hw, index - 1) before clearing the bypass bit to
> configure the mux selector before switching to the mux path.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


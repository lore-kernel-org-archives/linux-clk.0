Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE15A3A1A5D
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 08:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786438114; cv=none; b=eO6JR0g2A1KT6RNRckw1s/fe+B2Od/v5Z3N9GNs894+J2D8EI7dzu5DrWNm83vOvmRpWDyHOORljO9WTgO8ph+wkTaq+GaUO3RdidHeg3sI0EmXsEzQzB+ygju1F9qjkHICiK4sD6krlm/KZVJnEi/ZAcPut1WBtZlYYwPR6H6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786438114; c=relaxed/simple;
	bh=Vr+pajHFnIxD0QyiHCR6FJH90ILWXHCt3QnNj1iiwuE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=Amy0e4k8XMuajcpPOnkoQ7c7FPS2UdlrROGXU0WeURhId6etuA/9yjq5dulWlhKjTZZdfFALP5SRNM64md5t4spegWmJ+ku+OVGd0ab8CukCi9tLF0xuzxBUw/9pG6Zf1TCF7A9aY2jPVolzBBPLcb+sm9empxfsExHD55qUr8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdiPX63I; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdiPX63I"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso782713b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 01:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786438113; x=1787042913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vr+pajHFnIxD0QyiHCR6FJH90ILWXHCt3QnNj1iiwuE=;
        b=XdiPX63IsEi8FMfoEs1jDc3djqila91IzB4bTdD100yqc5ECMYU3TSJJCmBhSTcwsC
         Sr/YAcFfl9/zXMs6WSueCQtVsfnv4tB3Um7I05ACEHUtUKy+VPaH8/Gq9Pjt2n2eurFG
         TVG+2noiLceafD/hXKwmF7/VcRWtddkTUoxFGi0HfPW39pyWP+ffxHqHznRQKr5DkLh+
         91uuNnHD0k8Qum5saDcUutOOZ/xWVo6k4pLlkL64g1oPXYNTHtRHTJugAgSgUmmqFK+2
         cAFAnypXcOCj4aIoHKrw5HxjzAsS+t8vo9oYD+AmlXyN463tWE0l39Tr47Ga95A8Jjdq
         miIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438113; x=1787042913;
        h=content-transfer-encoding:content-type:mime-version:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vr+pajHFnIxD0QyiHCR6FJH90ILWXHCt3QnNj1iiwuE=;
        b=ZQfl5mrHl5M/1wMwL0/VlexZUmbGvR8xXRlMLmxKA68G+6cUX45ohOd4z3zwZEDx7q
         jKHd6PUaqfcaj24lWJgcBXgBj81qPEMN/BXMYSb6Vl/crjDYzLbkRXn+huBcHbRnPPQc
         h7j4DrBUs9pgdWdCEkqGnsGO3ImO2fS6JvpsaK60RMqNdlcex1VekZ1PvzRWs+i97CaC
         C9aFxR4FRRbOqBw2VzEudqX3wcuKBjKEC1XhyVVEtYNwAN1Km26NYqDly+99gmuKuY5S
         lrNiRPMA8K+LbBR1kGZnCiB+kl9LlSqY3ZCheUPUzaKfOM6/Y0Tdlbw0rOoIrHTI78ty
         TLXA==
X-Forwarded-Encrypted: i=1; AHgh+RpAbOI8dFvaPpzmLzaEMnRV4SrcXOZIj/7vbpDa/aDoLUrtwOk72lyr0QT3C+eMhYCm9iBGPMUPbTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxotSITz90YeA0rj+xL0HcLJ1tqMbWUP6BPPN/dQeJjuIALRkNR
	fs6qkz6sLHSg7OXOkwMFHMAFN4ZKC9v19U+3dT/yhVpxAUreEFnZfcM=
X-Gm-Gg: AR+sD11Z/K3aART6s1udQ+5CbbGphCiOM5WDkaGxqCUR1kb7urBnh7qnygLHW7HnOHx
	7XgE8uaQowwi4Rb6GaziAK7DzNtmjnA3WrYSvqZCF4QMueUElg9uivZfYzEv5NSnv4ZMB5PEXYD
	GkT62w6tDN1IXC7rw1egpL15QnUkG4YDPyfXdilTWtf3obq4BMSox7NmvDH2p0wSGJe9BsyVYMA
	vcz+d1SLkSPbXeoJ/6AGA3Ud+o6UOx6WkwJ3UhXHye5w1fP771oyRBjFlYuhIFk3US6jYzbrsr6
	uGmQLr1GCtWiaJnAOJI53bp74H/bLPmkQKfkZqJ0uUvLRnN+Zg1XJUS1N/ERTAGh4idYXa8xL1W
	SV2ouv8zKZx/K7oJ6bwZfjOEMvECYsvKUaW8TyrS5aPDAh5yfTYuKZ4pwuVeTJ+3q8uppXaKpxL
	E4VsFLy0IN0pZWwRuqhTTblexEpS3h2hBU/o1MXNWgQIOszUfWawGkhQ==
X-Received: by 2002:a05:6a00:885:b0:842:3c77:5996 with SMTP id d2e1a72fcca58-84fa887253fmr1605922b3a.1.1786438112862;
        Tue, 11 Aug 2026 01:48:32 -0700 (PDT)
Received: from octoberrain ([2405:1200:418f:8400::5d9b:1e58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa91b63b7sm353541b3a.22.2026.08.11.01.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:48:32 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:48:22 +0900
From: Robert Eckelmann <longnoserob@gmail.com>
To: vladimir.zapolskiy@linaro.org
Cc: andersson@kernel.org, bmasney@redhat.com, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, m.szyprowski@samsung.com,
 mturquette@baylibre.com, sboyd@kernel.org, val@packett.cool, david@ixit.cz
Subject: Re: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks"
Message-ID: <20260811174822.1f4bcbf8@octoberrain>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
In-Reply-To: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

The same problem also exist on sdm845, esp with sdm845-hdk I saw
similiar "already unprepared" mesages in dmesg.

Doing the same changes to drivers/clk/qcom/dispcc-sdm845.c, fixed these
issues.
Can provide a patch for dispcc-sdm845.c if wanted.

Best Regards,
Robert Eckelmann

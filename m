Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190864;
	b=aSjuVW4ffe6mb4mEOi8ZBihYIdjowTLf6fLVYpF3DVowd8nCiHpX6S8+Be4z1uky3vGi
	 jE3nlIzt1v9BQ6d8TL6qAS/R8UEhpmECZtMVt3ZkwN9BHe1p0hyFv5twWCS4pWKXCGJpf
	 DhyYeY26PQy4fU+AiKDo++mS0KlyDh0Npe2pd+QGxBIRUrYntW3Ilu//RF5RFHvnSIDSv
	 2S2BSKi/+I7VQ6dIIk5kcP4bntVKkqRQ5RjxvjE88uePvoDcTGrrosAVR8HQT1FA9imPT
	 pS8ex3A8sTU9p4TW2Xvld2EhlQQHrEeNyIGUwpQq6qb+cmsSQt4leTuXuU10HWkP5GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TBs7LOLsqlBa2l118zldqdkz8VqMZk4EmM0/z3WSl0g=;
	b=NOWv1aZqNBfIja5rfjn+1K8F8EDJVxFhkLh8zzWJPNI9i91JUXXM9UtTKHOUZ7C/3DC3
	 Ce2tShZxb5sVhAw5pvh3ZTy7vNGQ89mmj7EcqUEM85nTkqcCV8Ftn1zMiU5Sr7yXe3vAA
	 +1rDsfDjRr+w20rbksZHa4LtCMxcQrXIEEaWTrB72TgJLUw16GowVQiylJtpewV63OJki
	 mGj7/R51j8IJyOzs9oSm4caujjOd0cvNhGyZ4ddlOnpLHTiIv5y/U5yDc67o1FgP/GSpx
	 CTrSDesh5vS8bqw8cqXSjARYordRUUEQ0LWrhlpe2fFLE5T9FKiDJg2U+wcy3j7IY2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=U9FPy3z1;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D5B606A325
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 16:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D5B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=U9FPy3z1
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490d59c3edaso734428f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 08:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795190862; x=1795795662; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TBs7LOLsqlBa2l118zldqdkz8VqMZk4EmM0/z3WSl0g=;
        b=U9FPy3z1Ah3rO6PnmTG40mdUh7F5mJijJd3VXPUjTGEt1xQ2naZTeJv+4C9hwXa7UZ
         uiC3GVH5RBjmD9ahmLwJeQywXC3Nb0m64W/8dm40AMURypJBfKbLVWj5tCeiUo1WKDjZ
         4eDylj1/GVP6vZzNa3sc2/AR2TWqNavKKt+bOQ20MZF7UZTKdOJiHeBlMw+1s4Bpxsbn
         Wqxdj7AVIXwWXeYuNXsLXlmTX8rmJyGknlahNzCqIqtLJ30H7CXSdj865u5MhmNItPn1
         tVwT46hEkmW+YOBbKvyv47E1gpnzj7h4jp3y/wN2ozQychqk4ftTQ9n2iBmerZAlVUs9
         lXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190862; x=1795795662;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBs7LOLsqlBa2l118zldqdkz8VqMZk4EmM0/z3WSl0g=;
        b=0jBRVWailFd2qsxF93G4vxMy3jhEDemPOYLVUCVhMQCRdMus0Z91pbvOXqhqIx9Ke/
         SFZyYy3wdLoEsZvfcjrr0tz7hCL95+EHhAHsrTqq3uu7ONkOuaXJNdi7/sAtOPSbhmKA
         tFLvBw1joR2gpMvsThGwkciWZrHEqXrjcRj2734GhO3cvBQ0Z5SgvKDnCiwkXOa6Wt8t
         2pcCrkvlojdzX53zTDINXFGt2xZ2Uuu+2Ar8e6Ethr3+2CSe35ObDeM9QiOiDI5s5xO2
         TUreLEgWkId8YHLGHV5Ck5l+4aRYnDGTlga6Clyfib7W2tDy486c11O1LnXH5KP7M7xh
         L0nQ==
X-Forwarded-Encrypted: i=1; AL+hErH4qNppnnC4uOxp9n+vLPPNM44jTqO6b3JxNPB52LB4k+9ElIuZGCNbQ7YeOjXoVVCs3nmkHcPXIxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FoQw63q8qSJBZqFAo0mghhi4+AsdvM9f8Or8WrLuhlGtPxgoR
	jZazi2VZSTBbGffZihtp9dnR72AI1s/DaJOVkr9VaM4ZrCTgRhnefX8eP+UGFmh0YuY=
X-Gm-Gg: AZFdTZfrLllX1WnKiKD8l3NHtSCWqkXsBwYo0EeZKmcKF7WCxsxtuyaas6IHSNiVgCQ
	m3c86dy5wbG/yoZRDBK4FHUTAuHXAzPwqWFj4jfEmwNi4KHWFH4YBAFaEGfEOxa54IBZzmxz+BH
	TJwRnmpKkZ9JjxJh5RjNwglXIR5p52m0Kg0cKKT8/qabTZFVB9b1391lVuR0dZSEABLS5MGah8y
	f7cxma4FNfpsxmYZeDgvqeDPUuuiIrA5iVooHdQ0hsFq3H6JcCH70WksgH1YSDtwt/eU31Fk9jb
	zSG/CdVvlwESRo6tb1SemH9EKHVfTL6r3ZzF5J4BQNsOM0vjKssYAfULNyexa579So08wapDJAX
	VxVdHeX/ZdbCAXFBYNIQ3qVehTWQEBVbHC0Wnk6TnbtMcd1iOJjImQGhrG0U9/2oh5PpH7wpE/n
	DU5LVHGZIYGMO+i6OCxa85PAuigsE5H4UQviKkWmZdkB3gxbVHr6SQVW3XAdK7PcIDHe2mnAvwB
	CvgLG0aLKdDQOdgek/spVgU19TvkCqKDlVQZt6uv0vGIssJOyTALGrC5WHRNLObE1hqWTpAdHv5
	hjGfjYCsox3k0Gu5k8VzdGOsA2S4JZGoY1FYkRBydm1MydZB
X-Received: by 2002:adf:fc8e:0:b0:4a6:4ac6:d94f with SMTP id ffacd0b85a97d-4abb3956acamr6142453f8f.19.1795190861753;
        Fri, 20 Nov 2026 08:07:41 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf629dsm5958324f8f.9.2026.11.20.08.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:07:41 -0800 (PST)
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
Subject: Re: [PATCH v9 1/2] dt-bindings: gpio-enabled-clock: Add a new
 binding
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261015-feature-clock-guard-v9-1-c1c05a498d9a@bruker.com>
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-1-c1c05a498d9a@bruker.com>
Date: Fri, 20 Nov 2026 17:07:29 +0100
Message-Id: <179519084920.3795820.18319787881002052092.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=582; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=cWouKw16O3+lMqOqcbR6ybi2hZFly8D7u1jUz0/iQqs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMBU7J3bfZTBRXpzy88kisbUduVYB+t07Y+pUvNj+1l
 7wmklrRUcrCIMbFICumyFLDXS3+TlLry6zpOrdh5rAygQxh4OIUgIncDmf4yfh5kavm45xVa+p6
 na0fbhU7+9PgYLrlwZln+ubMOvSxUo+RYeLPCS7BxxnqJbuDn/SfkXrA175ufp7y+xuRJnnzd1o
 68QAA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Add the binding for gpio-enabled-clock. A GPIO-enabled clock provider
> exposes a clock (can be any type of clock) whose availability depends on
> a GPIO status signal.
> 
> Some hardware designs provide fixed-frequency clocks generated outside
> software control, such as by FPGA-resident PLLs. While the clock rate is
> fixed, a separate GPIO signal indicates whether the clock source is enabled
> and producing a valid output.

On v5 I pointed out that the input is not fixed in general. It might be your
specific use-case but it does not generalize.

-- 
Jerome


Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD8E3DF008
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 09:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169527; cv=none; b=OSYxjD2E4GwmwxO8DbabLjADrDtKEQo8+s6uxnyf7jkF4GVpdVTLU4CRRFiYxqqflraofSMHP4yQXJQLowj31jfE19yVachr+SQh3194wM0PqMm8YFwIe8qgi9p/NQIRWFF7ntY09suLDF5LR+lpkJ7TJF8EX7In5GF61c9pfsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169527; c=relaxed/simple;
	bh=rhIMHMOLnpQiyCwraNUoq9MA7SOjQO0C20Cw0tZcSBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=olhVTQwjxSK1/yHnuDkgop0d7/7s7DLg1MDSjuGgfMjfbebnOY8sm8fzgwH1obXDQXUws0VKuRNDIqYdAGxaowZY3ccjvOQyBAfLp10PYD2fpj61IEA2NAP0T1W8SViwlfnqM+DRo86X3TwCuNqgLL4rLX8fGBKxCgG3RN7DEjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IaE/THbf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IaE/THbf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so27563365e9.0
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 02:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788169523; x=1788774323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1adx4Gc+EAGVyQph6bJvgo9B2nQWzOo5SA1jOlLp1vM=;
        b=IaE/THbfisO/0wZAGnXPQTQw3oYSHoGoDfeuRxTsAPwft6lZ6qgLIaZ+vqrbN+6rZF
         Gs34u8GJKhf58OIHci+oxDsHZGwyR+kpu2xnu1s8GOLa3nqIsAiZOl7Sw38i105jvroq
         oPBzC5i46xt4X+3zRp1C7L7lB7WV/nv4z/myaJ/Sn4FBK7ughgsz2yntkXJhmnDEZIJC
         y8fvo+/sLM0+XGdoiW2LVaEBL6x8W02rAVm7POxtp3k7ZEbR3vY+wubuaWv2htzdVOe6
         t2+otemKpOmucJ9zJntDhbXYAkiNbemWVUOKDUmg5zol0pIpjaCieum0au+j19uwXIQs
         Q1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169523; x=1788774323;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1adx4Gc+EAGVyQph6bJvgo9B2nQWzOo5SA1jOlLp1vM=;
        b=VEIdEBYNG8T9YeSpwUJgRwcop2rHgfhh+U9RQCm1/FBca0lrMh68I767t+lnzDhKfb
         6uZq8PUzlLBYpL2ELzUyvoC6IPyl4sxT/rSwdpadtC5nGfyZxPOeRf3uS17z/9ipPKCh
         arOSmVNVzcgjmCGOzex0/NQluQ1kaJlLTh6d57lZ2VhYOlM9+6qlG8dWrXg4RqiQIQrU
         RDPeZ70gpBhqVP3vvPeegglsXh1UXJ8v6IbQbhP1utzWLiAN8ODk0edCFdo5DnlXr6W+
         41c4bCVi8DwMb2SHyQ0ya5WDyTStLlqMUqk78zAzjg8R/fdSb8cLXNSvi8T3bM2Z44PX
         4LKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2i4hoNh33ruc2cNIoXQpG9QsiOYHZZvCKBhpnow0+erlQ8mUkRPqSOeeaamw4HaRaobpUHrrQslQ=@vger.kernel.org
X-Gm-Message-State: AFuF++np6A4vJw9Z2zR2XWMctTwshJN7RvFrrQbGzoWsJI1mhpEGXmBI
	+nGB1CKIP9TtrS+PIer48esDNzSbcQuUPpXwW5WH6wwR4wLdYriHZxe5MvXlVWxJum4=
X-Gm-Gg: AR+sD11i+KeZgTd4ZgJpTkzkcD+Cbx/DOiBORoqAp9wj4NWwroWt0Tl0RE5Leeeuqap
	NvDs6I7t6wprWCMt4xwyHUk/UV0uQGjd4/lG/VnXHbRgTDNBnioX6sT6eLtdJn2mjUfMYa+4kJB
	KCo6Q50DmdIWH3k0cCRFgDxqiNcqVgNEmPb1V28lzqhC5dxsguUS195F0l8bOTIbesH5VXNdetW
	HZS7cOTzx5hBBKSUvZegxq1ywM0nBfJk9bCuurewIvzF50RR3FlY4xxjCQxwpHADtT+fqcozofH
	dlGyPjxd7zc5UKJTGpeLiQKdZqMBSOLSVHbgIxkfQRCJ/kSORh+lnZ13ef5JxS6aPcVgogtilml
	sfBqb9v1SYOOyCRG0vAE2atJxAaBumw/wyiNPcPa0oVny7KfHFNYqBa8e1xRCAfzSdpTcI5D2xh
	WwD3ExXu1NKVgPRoE8JZD1+ln2GL+MWZNy5xrDcrmBOmjlDrF8ALL9mgat/g==
X-Received: by 2002:a05:600c:1d08:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49b91c2e145mr374445115e9.1.1788169523048;
        Mon, 31 Aug 2026 02:45:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a65d:30ba:195:2a4c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af45sm12860834f8f.9.2026.08.31.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:45:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Lucas Tanure <tanure@linux.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4 supplies and keep the fabric clocks running
Date: Mon, 31 Aug 2026 11:45:15 +0200
Message-ID: <178816849353.1471657.3294500872963560105.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (clk-meson-next), thanks!

[1/4] clk: meson: t7: keep the memory fabric clocks running
      https://github.com/BayLibre/clk-meson/commit/43e1705ecab9

Best regards,
--
Jerome

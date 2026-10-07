Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FF242E41B
	for <linux-clk@vger.kernel.org>; Wed,  7 Oct 2026 09:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365428; cv=none; b=hKiys0KnxAn4oJKlenGJYtJjdUzl/zZhQ9P0yF50Q0OlUFmPxz5b8fDL9pjneY99UxTAHeK2JOo+giLkIKIOy2zV5WT3PZ+y751pXQaNjThy4yGOLWDCirBkA3qSEIxVbYRr48ajpWBrI9+Iem3Ji9dhNpGPeeOrvsI6PkWxVAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365428; c=relaxed/simple;
	bh=fnREJU8RfOH4SBc/tGBqPZDLHV9OjtDiUqOdQW60m08=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uhJaSU1LXlGeIil8C2TkiJnL0F3rbdYL9ko4rxOm6k4QImmx5pSi65KToNCsBOOPlGrMc/+rk/7HfT9y3gN39CaM+sZPZUwD8eQ/Z5vxovKDH5zZFwqeG3BbnthC7V9c0ZvRS3ZzyH/fUyoe45kmMWo6cePy8rZP17NCWzXQQzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kiyeFulZ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kiyeFulZ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso34847895e9.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Oct 2026 02:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791365412; x=1791970212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwajthKf2+GbCWoqy9WGbtWnmSsX9wI1UGn45I35+Xc=;
        b=kiyeFulZHm4QlGeaDH4nyYtB25+6jxeIAwyUl1zVB1kvSrK2+CM274/WHlCaKQC+7U
         trXikVY3xoegh0E2oH+99vLrOjCB2AC6Vww7jF6FYeekXoof/d6Ji6AM7RoGyyVbQQ4p
         xfPFEXBGvgCEJDyCEXGQ4+IOzSIEZPMF/mHDGIDqRi8iT2299su5M21XvQINCaZnuW/m
         M5txF9urzGhnVhf4HwPbat3pVA+rkOdEtQx1GbosPEZ+xhd2sLyNeQ8lUc+6lXCR/M3w
         I7P8q17gyBp7LqQWiP0Oohl8xH1e08haJKKZGlBTIJNJbFfo0m8pb/YuigQctwekY8xc
         8fFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365412; x=1791970212;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwajthKf2+GbCWoqy9WGbtWnmSsX9wI1UGn45I35+Xc=;
        b=CH8fnfn+RzvKh+lcGhVzkJVBtvGbq+Gi9c9P6qimxfN+TJfaJcLzgz83Xkjb7ecfKd
         Vrs/B+kwU9u7xGVcjzriz7IW1Mn8m48wMU8+Uq72I1gsooTfTV8mrcitl9r5SlOsJAZX
         iMP75ixYKT4hpSmvLoIt5YqqvMzix1VVBYDqn229YVTxlzn7NlZmlrh70rtIdLyb2oEo
         zMQHHyOKek2VwhWbWEh0dJr3Vi78mVuskJaYTRoRhXbjZmqvSBjMr9ssYn3o9vcrzLbd
         XxHs7F5AHKQu5AWgQdWOqhIeKD+jcjCKrzJsrjDSifW3810vVs0VnZ93UZnO/tyZAI8q
         e8Zg==
X-Forwarded-Encrypted: i=1; AKwUvBy5pdyBkeOsyQvP+8Jx0FIDD0FNSu/0I9aFvvLwa1Pm6tuIjGNtJ0NAJbBrOuIRaBedxSRdbW/y0PY=@vger.kernel.org
X-Gm-Message-State: AFuF++kjmHofvtLYskqSu1x/kvAbVPnqikDGTRrOhI/0f4Rz6JrgwUo1
	K1s8Li4E3g78zrqHNGk8HXp51n3/eFRoNJmi6A7Tu0EIOUwSblvsBYx0ripE5m2hHGc=
X-Gm-Gg: AYBFou1NAcUwI/Xb26/N7y2ziERSY94wq+e/id2wyomNSJ4ipgHdhKMCT7qjR7NV+to
	gPfOcn15VZPt6JW4qxfyYFOUTq/XQYxfHIpg8aSnVylLzg5tLENqg3CUZYSS0kprAw9O5AEcgbi
	6W2V2bMhhKd6pcsG3e/LMIO4lRuOtsqUkcvu5mxzXI7pvqob+vfnfBanfJrFmX6yU0LckTsEKGO
	qdF7kjjf0zxzqnLgUq7lQbZKRWUvwPkyDH7/GggTxG8e26CKg/ZqYKGCchOjoQSmv7CuRddQ/dw
	sZ5PNeCY6czGvr5Ec6DPFYebrNZomc3dAdNeaRNwvlgFp1ECZaSnOd7qkb/v30JQLz1e4IEZHLb
	sInfvtJYQa/87JTE+fzhkAzPr4mtavx72RLpZr0cWkDnbx6KDmLeDKrUGQ+hJEpAlOpCfgmLPF4
	gtedSUXBHqNfOZsqziEKYIfSGtuuncVxL5SabymORWknOgDNOmjfPOu7Mxgi7woraYDl6UScgDo
	QWyQ51v3q/aMyc=
X-Received: by 2002:a05:600c:3b98:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-4a180422c02mr24533235e9.10.1791365411698;
        Wed, 07 Oct 2026 02:30:11 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d13a01sm4753433f8f.29.2026.10.07.02.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:30:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phucduc.bui@gmail.com
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Liam Beguin <lvb@xiphos.com>
In-Reply-To: <20261006110501.57051-1-phucduc.bui@gmail.com>
References: <20261006110501.57051-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] clk: lmk04832: Handle reset GPIO lookup errors
Message-Id: <179136541048.165493.11954789391773038389.b4-ty@b4>
Date: Wed, 07 Oct 2026 11:30:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

Applied to clk/linux.git (clk-next), thanks!

[1/1] clk: lmk04832: Handle reset GPIO lookup errors
      commit: da51c9a6f60ab1eead089c23448c9ee6a192635b

Best regards,
--
Jerome


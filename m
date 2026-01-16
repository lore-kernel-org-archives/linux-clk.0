Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B020733DEDD
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 18:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768588749; cv=none; b=VHlMXcKwu1LZeW/YaHpwuO4wVTDuRQPLs+YFrQVxy0E4bsA3fvH8mU619P0K+BYGdzAnHp4ElnmU72AVLs/jkF+s1+oUN9aQAalayR9A4mhG265BaWoHX/CVmBpemhBz1k0Th4+NljLDXlVbI8jJz5KukXphGRKcAfzP0y2bUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768588749; c=relaxed/simple;
	bh=d41syVwVZdKjv7cxV7/aihYb8fxPi9Y3sb0RmDUSMDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iKfcFd2Gxrxq/DE5bK2efKkuf33tv5J5G2RP8l1P0s2Er5rzSiI11bm33RRmT9qBlkih1/MDA5pGMoj5n7r2GQATZ3h4WB/55PWC6+K5QPDiISPQFsUR2IZqj+V8tfh2F/z4JBXT2q1X7chKjwElaCWo26cIkY7SHe3IK27gXuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFUIXkHd; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFUIXkHd"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-432dc56951eso1521057f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 10:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768588746; x=1769193546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtATPDsxWorsaJSHrXqsG5j839hXtsmCTkBX1g557KA=;
        b=iFUIXkHda/MqoaTbXQCrPO43tvTtVMHYPOrm9QU7Q5LrHBNrH7gzLfFTezAiWik7Fj
         uhqGzfiej1o9M6gsFYrlc32cJo5t+QLm955fDlhCi4ClJg7V43Wnflp3jBDxWggtYuyE
         6xTF9LS60E5hiXa9532s6atejPcpc0vHP00q+oeaVbMSv2gGMQlIyOJQT4LGw4A/7rk8
         SfAd0icEf9e39M7EQe6gd+8VNpGFAIWMB+2NcDdqXU0CzyXJ0CKmZwjQRdGQfhMfIt9m
         osHOV/5ahP4fi7rCcaBmMyrqVZQBVBy7RJr6v9fa2bPoHInfxIKMtxAL/YmjO6L/v32A
         4ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768588746; x=1769193546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qtATPDsxWorsaJSHrXqsG5j839hXtsmCTkBX1g557KA=;
        b=FFglCw7eaRIYm+5fjuMHkNdY7yD9k0E6fpnrDvI+M5khOpaF4RhIO8ggioH5ZgGJK6
         Ddj07G8ZE5svDz0DRpnyR8n8yl/ZzTYUjqZ3ATe4SefeDI+Si06i5IIy1Edfm7l47IyF
         sSMATmo0GGCgBVtAf6ZXo3OMR7gyUmLGGAdtubqY819/MXLx0klu0qtAHs0tqJFvRsOf
         b7XP08Yg5MFBrrzf31qpDYZhGSJNoDo6fLyFPFTgqHaGngFXCspyERxMj2BVXxLk7Biy
         9BQmSi4JdHLdHpA7GQbLiohLIcJbAm8BjwTL9TlWsXccIt4AJG66QdJz2amT6vq2Uob4
         Tr8g==
X-Gm-Message-State: AOJu0YyxHRMv9aO/58K//MT9n5xTE3j7hD4yqd2UogTH2wI+x7SPmp1l
	AuXmyeIwd3epDMzdDiGVO6trP3qUlP+t06H1ez2btWgJZ16QhjrqIOOC
X-Gm-Gg: AY/fxX5vREWc7YbqaumwLuE6VWt1vjWtnbN6fU/o790lZ3B1tqHMVIxKZyvZTB2X5st
	M6jWbncUMb5DUplOCc2d9pvuZIAMfkNxcgipIWONbgLNMIKJMkn20EJYNxX0rlNNTRm+1+JjNAX
	uAXsRzB7CeGzkv6AKddc50uH/6Dskvegt0EF2Tj94I2mcEhqWCtQX9/U/2Q5O5jT62MnPK/mquP
	frsOAFBWDJ8g8h0ZrPFg8kXAX5ADpeTH/CV6dLRsDyl0nKcGN/tJWUDhlCn55nh/A5I99MJmCjA
	iWQQTTdx40Ukb+2Cp1ZWd+f/0A65ZyANkkOgtjk2ys9OEbAgkIhxpNrVmi1akJC40MA2d3j3wCF
	iLqIH2d2U5mdix1pCyVIVBGne6dZu1Xr4Cvt3wWcJkQeLvlLfe/uzRKZPx4gaclMoJebl5KGj10
	Bc2/6kDQ55bcDKukcMWLKcV6SuD4CnXU8iuvZRnQz5fV2pnv71wq3FlSlvUChBdZYa/ge9iyoCq
	IJ55kk=
X-Received: by 2002:a05:6000:26ce:b0:430:f5ab:dc8e with SMTP id ffacd0b85a97d-4356996f129mr5220791f8f.13.1768588746076;
        Fri, 16 Jan 2026 10:39:06 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb1fsm6846449f8f.35.2026.01.16.10.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 10:39:05 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: pdeschrijver@nvidia.com,
	pgaikwad@nvidia.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	mperttunen@nvidia.com,
	tomeu@tomeuvizoso.net,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()
Date: Fri, 16 Jan 2026 19:38:58 +0100
Message-ID: <176858859966.165514.1542929598310125407.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115050542.647890-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260115050542.647890-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 15 Jan 2026 13:05:42 +0800, Haoxiang Li wrote:
> If clk_register() fails, call kfree to release "tegra".
> 
> 

Applied, thanks!

[1/1] clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()
      commit: fce0d0bd9c20fefd180ea9e8362d619182f97a1d

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

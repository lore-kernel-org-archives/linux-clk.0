Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED14153BEE
	for <linux-clk@vger.kernel.org>; Fri,  3 May 2024 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714742558; cv=none; b=P8LdEWMXd5K9C9L6PTBRfiRcVFSNhSGFLTd8HxJYol6gpREFGhj5BykxQ2SJM37NRUTFwc+VI2m9DjTIqKNS61JugDnNr1OaQzD2QjlTm3RaH3N5mJK6YqvB1ogZTJOby4thXo8+Ol/sAryXAuZTPqt4v/ifXsv/oacmlk4UTfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714742558; c=relaxed/simple;
	bh=E+SpOVvHGi3ykjwFD60zMDyQU3xXnUCfecCHq2pmGR0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A6RYZ2yRgg3jV5hZBLXI5l2rhg6rQLbr1tD8HgFw9gPtP0/XCb2YXCTMNbN5/5RMHzRW9sZqDO+PmtVazXNYkXcUC5g2FQ0L5A6VSehwiuQUklJDwLzmXDKUrDR/bv2t22g8+r9A2FYsBhkOBjds4XQFAbrilthGPrdPP1opuOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=H3uby9WS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H3uby9WS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41a1d88723bso65065205e9.0
        for <linux-clk@vger.kernel.org>; Fri, 03 May 2024 06:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714742554; x=1715347354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kit1TBFVgyt1sxkCYLtPtBHsm3h3unJNtgT/eeVBYto=;
        b=H3uby9WSHlqYlQsoj89ksCUdZ+ObButx0Sdz5iNADIH1ssb+HHRxyD6JK4itoqGrAd
         iGBlJ4rRQNB8BmCAC1/CiNxRfVc7A2Ae7isOgPJmi3poR4f4tu0reVcOWAiLJkMiZzXP
         KLo8XMatacuH3XEbOTpE9FRCPccJwJlPmQTgQGOOrU2r1PjtozpDf2henbS2QBRJiCRs
         knGXpjmIlsc68t3twNRPciWlCeyvmmxVIfGOjDMDrdtiTzBs5O20tgRfJ10CohHrWBx3
         mH+ptt4vz/aGQTd19R8W9rNWE/ah79wCIx4pIelU43f2zGw9J1RDIBayo9x5aBID3tK/
         jSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714742554; x=1715347354;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kit1TBFVgyt1sxkCYLtPtBHsm3h3unJNtgT/eeVBYto=;
        b=Ns69hHr4sGLOa86Eb0izUPEhWdiMOxUPXV2pOGhHQl/YjYEhXS3eqzA1d3YYN7uOPl
         9In0SkHuX9ok8a4r67oV6gA2AjIjVGwFkAY/DjuJi3ksQJg0F2T1nImodyVXEZMO593p
         0/bEq5LvJXedc5XfLYSCM7vjmZYYRxZmEzdXdHDMA+DMtnA+PEWxHldxUN/sURDx+7Qv
         TqSyU/JeZhyckI5YZcKYosMRPGJ0tBQAjlIA2LssgyaQf9e6w9wbQxpzMtsVPyvHnbw6
         6EatP/eiZPHExRBOs6ChVh/Jt0lg5XTNz5a/M8oy2utnizZTvCY++PuqFFdLfOTJnHdH
         TJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX08dCh/bWt/3sFLXFQbbX+6J6RIWXGVsgzX38xvGxaGQVaB3yLVNzEIKf0/iV11b56MH6UKvAFWLlyvChiwuMPBucIii3jzvpK
X-Gm-Message-State: AOJu0YwnL+hJLMys2AFrYbGwM/0LIQ/RywizWCtEKRhk0pdKvQgC0UvH
	6t+kvFiDHLQ7sCTM3eAHVKzfWtZTZf3xxsZRM5Npfk49i3dR78Na4dw6IB0MrzM=
X-Google-Smtp-Source: AGHT+IFMN7kbGVdBfJ7UT+4XcxNE33ol941/vCrMnxSahE6k9NpvMQZvsFEr8R/ZH3PzSShRqGZkew==
X-Received: by 2002:a05:600c:4e8a:b0:419:f088:249c with SMTP id f10-20020a05600c4e8a00b00419f088249cmr2174709wmq.12.1714742553772;
        Fri, 03 May 2024 06:22:33 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:1b85:e590:355b:9957])
        by smtp.googlemail.com with ESMTPSA id g21-20020adfa495000000b003437a76565asm3803713wrb.25.2024.05.03.06.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:22:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20240410155406.224128-1-krzk@kernel.org>
References: <20240410155406.224128-1-krzk@kernel.org>
Subject: Re: [PATCH] clk: meson: s4: fix module autoloading
Message-Id: <171474255291.1335139.15327121235218632635.b4-ty@baylibre.com>
Date: Fri, 03 May 2024 15:22:32 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

Applied to clk-meson (v6.10/drivers), thanks!

[1/1] clk: meson: s4: fix module autoloading
      https://github.com/BayLibre/clk-meson/commit/11981485e27c

Best regards,
--
Jerome


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782227;
	b=Q+dPCBPkxkKA0fime9jX59G/WnuicYnG20bz6gfMz9KIAkWQ6fg4cFw2zUji9+wqUQF1
	 c/xFklPWFphwJpj1s7lad9Yk0Oe74ebWIvp0g2FjD1xFj0Sg5xt7zcLzGUNTXtyRpVglz
	 kCJsc1W50R1Yk/JaQWmkTPxcpwTrGlK18ORjiQrR14ceOOZiObG8APlZiI4HecAQUKeO/
	 Fv/qaD5pSlBM/MAubf5JoaE8gT9bTTCFioyC/LtRHHoiePKMxqnDL+pLIlVpY51qZrhZN
	 sxbOS8sKR83hcr2+TCyWrVoydPW6LX+/zv+zTKqPrpRr6C5uMiFzlrCKV4EU+yPSwxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OlFwj0OOaMCtSwQfLQtif3SH0UBBq+9kAcPIWGrQLlc=;
	b=5Pba3VFS1RU/ZgOppu9abS9NA0z7D87wymsF29cKUTSKbsAVf8MAKIYMxI9ZSyPS64U5
	 QZJIzfbHPEz2PN6i/QsMd0pH0FtHbnNTxPXtZLJIGLHSK6zOirPY9yCSIlCyCNtoqBxoi
	 0eFCVnGdYRoy2+PML/eQ2ajy738RH6b08uuiB5xCyp1cUEokFBCeCu2Ko7U0xneF8mtN1
	 4d1wE5lKIi8cUgo7Yj49yTtuIty447/gnD1Dro6362qXki8oUSv7kQIqwhecnurAQ+RmS
	 u6iQMaYuroq/3gJV6vajlbbYO2NLERia56mIMenj1CM3Nr/G3SJ8BbYoKc5Ls3M9mCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UlDuhFVA;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8466D606A31F
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 22:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8466D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UlDuhFVA
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso16311655e9.2
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 14:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794782226; x=1795387026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlFwj0OOaMCtSwQfLQtif3SH0UBBq+9kAcPIWGrQLlc=;
        b=UlDuhFVA3CdFgoQfxB4iU84iHeqvmwEESq4cx986ua/pBTS3EWqj6KqX0PpmQkOJI4
         OHtiHzrjN7pAcfIjoacVcsMqhpZaIWGAOSdU/idkYFVN2qohv139gauH7V8ApbwjZjRA
         WT/H3CnkC7iaa/RNm1ZLRh3getD0dXTO7EeN3QGvjqkihCdqX3yG+cCdtLT2UJxVs0dt
         zI7ViMwkdtP63K1MLIKIowVHzJT6O9UiYMIBXutePOnDx+mPSm30dmxLYovM6Uq+ItlG
         LYVOEGIFk1pszczHHKYbwf4D/12onUBwL+9eGEBPgAcCjCHWMh5f4QJN/udvtfNeqfUE
         U5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782226; x=1795387026;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OlFwj0OOaMCtSwQfLQtif3SH0UBBq+9kAcPIWGrQLlc=;
        b=RuoBFgAgtP0bg85dpD+6X/vL5Kx5Jlu68BsMMmYC5ZzfWslKdDroCgu1oUXFxc6aSI
         EqDgXyWndc6PuQD0CK4h7GkIawpCbO8h0+qwulNp4t8SC9l7dRiHsO2J40RhIK2ET5qI
         Bv3iZDPfkIF1c6ePMqcF0jjcSPHFDFV+1AXUQocPSK5i6LWi0gXYpWtN7ukt8a7fpGoG
         vGmgIzs3clsqS48heIYKYfPb+0UuncLecu37qMUVs0a8jBeknhBa5aIe58Tm8i4o1rUC
         LRb10nCbDPbyOijJbHCv9RrpOTts+93uMQRk96968IaXdSrbBYfSWEpPdoXCz06H7MK4
         Tj4Q==
X-Forwarded-Encrypted: i=1; AL+hErEySu6CV9aFysu4xxgOPQOVIAVrbaG6731mkfqZxqgbTHrT9VOuwdmi+waiLEsfGqnZfPsqHQq+lVk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WgYYUat8Fo/I1QhU5xzuP2Re2s5prJuvK9NZ0NhdSeLoEy+DU
	T6CSzgyFOaNpIRuiRioq+uGV/C1zHuV20q1kpn0JW/6W+GbcsQttrdEBRTGZHGZw1MI=
X-Gm-Gg: AYBFou3x2P1sQYtYaV8AV+xPXwQj8w2a19dCka+J4jyF2RPyBO0x3+v22sYCH2/SF0B
	GLkYrDAIrNiAbZ1w6RG/HLwFkYG7Otq57FJ9RZDgChAtcQSjemqcAzUQQ05GuOSXQca1th0g3jJ
	3nlMsYqkVqFcguvVDcuUEq1BAA0FUJ53wOwMuZtFv6R2l0RiUWlK35BxuoG6zQznJzLoAgzDqh3
	4kpIJWeTYty5iRWGXtKFDNAfxbAKEKmCfAe+6BSsXowQAxO7OIx5m5sxX2K+vQ14mNFzYZTXXOE
	WzWpi3YO3SswNqO/kxI2FJjSzavfYKuu1d5wkWC32A/PvcbaDtloUj2LR8IdtVtfvvCR5KrWABc
	rFCB99+Etta8SzPS9EZ4vYr+J60Vu1jql/hglVtIpDwTOs02BxoYuftm3bslL7atB+rjQdjyZZG
	09Si/RpP7VzG3EJyJi3IrdpXD2D23jkZGG9fGAv8DO9yD2gCuzNn9I+NXL099hxP5SwfU6LngwJ
	wAC/TKLb4bso/Pup8iUOc7JHFUCWAKhqg1NvFiSE3si8OOgMt4HrIFh/Nt1z9ka35N7R35mRfGh
	0Yw6opg6tCg5nPGH39tsDubPjtlsIVbzHHH5tdb4R0txnX71
X-Received: by 2002:a05:600c:3ba4:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb741d1220mr5026685e9.7.1794782225857;
        Sun, 15 Nov 2026 14:37:05 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7292c04csm27506865e9.11.2026.11.15.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:37:05 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, yu.tu@amlogic.com, 
 christian.koever-draxl@student.uibk.ac.at
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
In-Reply-To: <20261106101827.46467-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101827.46467-1-christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH v2] clk: meson: s4: keep the PWM clocks off vid_pll
Message-Id: <179478221481.13037.4595055180281805820.b4-ty@b4>
Date: Sun, 15 Nov 2026 23:36:54 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=190; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=kSp2XHPUdyj9arJE5zFouPgC7s5Qz4HXMfZKSQrP6NE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm/TAR2851bnrrGinOP65LEaV2sCwq3rzVcpp2+lemH4
 cwdh74xdpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAip2Yz/NOYuTW49Gm/6ZoV
 G1YHrvFptfdZafT5u+2+fzdjbRtO1QUx/LOVE65sn/R3te9l1yuzrse/cNlz8cvRu/85nq/4eiJ
 RRYAZAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-amlogic), thanks!

[1/1] clk: meson: s4: keep the PWM clocks off vid_pll
      https://git.kernel.org/clk/linux/c/cbff55924b87

Best regards,
--
Jerome


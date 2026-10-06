Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9245839479F
	for <linux-clk@vger.kernel.org>; Tue,  6 Oct 2026 06:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268970; cv=none; b=O0xov3vR8ygSsI++F2j4ZjzmN3BWpJ45wIsPx49WT1k747rJ6K+4wTKDVwVA0RRmU5+Gc2U4xrtMlftFh3bsytpM6YJVqtx8XnVme3+fM4FlOkoigTnHW3QT7tzk8rz4OcBBFhq8gnflH5l1/c5YFMM+0BNWDtridElxAn+GfxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268970; c=relaxed/simple;
	bh=/89uV7ti2K11U3cB31sSgf1JcllbYfkCwr4VKRFLXo0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jAMd1qeC/ekk/RgzGZeWD8pArmHC2/5h4DdZYy2TTZ3fxxbtuUXdXuVsqTAkQdEYhzFzbwb8NHB2skapZ/0axfR0/nI7mQKcyBDAIVo5TtTza+l0rWqPZD8z9CNv3re7HfFyKwubq87vreloV1i0lQTD4G97WT6/afReKExh3QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0c29tWA; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0c29tWA"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-34ceab2900eso258670eec.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Oct 2026 23:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268968; x=1791873768; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jj0M0FNSVgErT6nNNDG/5xniUjNErRGkcSo2LLHcxBY=;
        b=R0c29tWAF4PalyEtX6wbtcrtPBAISA3Z2010/RluzMRWqM6u+lqKDilUMd+YY31CFh
         pa+FSiLRvdNtis1UUHNPZW+cfTvFV/GH08FzQ3ydBYB9StfBl7VMm+VNlLAsF8+0mqho
         9F9dpVsOhUWVnzzYFKWceItUygfEx7dhgcJWDvDQ2RkQ7UqgR7ouXmxFbKhNiPKocLZZ
         eT9Y2k3btLHfSFRgaGXNfT7mje5VidLv5dE1AoFyoqfP3Y487ImCiTedqDRQ5sm9B7l8
         1+/S/az4xetLIopzXCDTtUMfdVE5lX145MAG5N4j//YiiKKErcNFCFHavLhlnTnZ6Dj6
         23Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268968; x=1791873768;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jj0M0FNSVgErT6nNNDG/5xniUjNErRGkcSo2LLHcxBY=;
        b=X0xgywFr0FfIJvaEBcugSpKrKPtLwXhEV0BYGVLEM7Xj6uce0nMIDlWJnmS1AOjycq
         OgR2Se2mgSC3+4BE3Pyr45nLhg3swtdHlYtkdj+h98PpiDTu6tD2masiNOE5CJ+6qPF0
         aNjyZts6bxo24ZgmJ23Ke6n3wxtqIprDwE3ZxCOVv01vPjZXOER43FWMwMBQwSzld223
         jOaiLuOlMSEOXGc38p9/ku/iD4E3ogFhAL1vvr6Gypacx1vRVq3HfQvtoDQi9oiWkgUx
         tllOegEu88fVV3otQ61iy36YEivHY9U3iJNB6mw3Arc6dyR0qR76i73ZbFKXxFl+1Mu7
         SLkQ==
X-Gm-Message-State: AFq9FYKs5IySCMUKkt6O2SqVdGz2ZFnxHxhozgFdUGHQAjXr7xJmUxZK
	WilcuUWwYrYrE3qzUr0cUdgkoEb8Htda0RTZXImaOn5StB8G/AVNKAxh
X-Gm-Gg: AYBFou0RHqDBCVAG6fyqYENpdFZMaxOXWsz5dLaTZmurYsUxlqWbol4JkiYnvfKUzuM
	M96GssD3As40OGpxiCBCkDyhs+hkI5uicDSUDvsRd4hbH5D3kxUdv2YEpCVw6jBvuNrzkGQX6rp
	VF57BGhLIPbYWkB3MSvhyp0xDuktJWH3EZZtlfUnEnEtJ0LkG5muf9pQpX3dkJWity4UA52U1n9
	5Y0Bz1PfZOFjieNhKJyBu83L7D9vfT2qS9+Gzv4I9Kl7BBBGQFS0QK/lXO+GcLt1TTontMalKda
	Bmf1g2zYjz8gpquj1DrOWUIGnVRvU47ZllDgBdhDWw9bQsbGiqlYMMUBDh5WYHS9ibXk5DO8wnY
	o4xwcI3U596KkwMif5eTZ4C7mKwD3gzec0JqhmT9ipFdtjAHJ3hh8wkbrWxQqa5DQlVi9P4hN4O
	d31xIj08S0ehyB3PNwgJIxkMh4a6rKs8GA/mLYkpDom+Q4Cf18OTjWYV2hpNp+F10k7DJxpzqpw
	xdJOGID
X-Received: by 2002:a05:7300:3e8a:b0:34b:fd9e:ad4f with SMTP id 5a478bee46e88-3514e314fbbmr452029eec.22.1791268968324;
        Mon, 05 Oct 2026 23:42:48 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:55f5:25c3::3c3:b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm4617347eec.14.2026.10.05.23.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:42:47 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 0/2] Add MT7629 RTC clock selection
Date: Tue, 06 Oct 2026 14:42:22 +0800
Message-Id: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCMBBA0auUWTvYhpA2XkW6mMSpHbBRJlECp
 Xc3unyL/3fIrMIZLt0Oyh/J8kwNw6mDuFK6M8qtGUxvXO+Nw2BxK6MzHrVEHO00LeRtGChAa17
 Ki9T/7zo3B8qMQSnF9Xd5SHpXTFzLeaNcWOE4vjjXKlmDAAAA
X-Change-ID: 20260926-b4-mt7629-rtc-7488fa94b1ab
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

The MT7629 RTC mux can select the 40 MHz crystal divided by 1024 or
1221. The integrated Wi-Fi needs the /1221 source, but the clock
driver currently exposes only the /1024 source.

Add clock IDs, the /1221 fixed-factor clock and the RTC mux to allow
selection of the approximately 32.76 kHz source from device tree.

---
Chuanhong Guo (2):
      dt-bindings: clock: mediatek: mt7629: add RTC clock IDs
      clk: mediatek: mt7629: add RTC clock selection

 drivers/clk/mediatek/clk-mt7629.c      | 7 +++++++
 include/dt-bindings/clock/mt7629-clk.h | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-b4-mt7629-rtc-7488fa94b1ab

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>


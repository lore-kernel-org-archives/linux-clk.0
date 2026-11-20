Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185737;
	b=a4XVUpWSPQCuEtDWF6P4PHT4r9++ZjRAj3htNPT9BMWAaEYXLdx1F/+SvpjiSKeltcnV
	 /ch4ME9GE4enbofLBjxFVqrOCboAULvMXR7S1Wqy2+NaOMZ43lCrqf3SnBXZi4WPVUdhF
	 3iEkl1r6RTiUN6Uw2K116XxZUAI7Mmkp1JnjvVLesjyG86lw68pZDdZ0+ICdmDfBX1QWj
	 A2NFe8CORIN6lKoxcsrf4RYldeSoi/WoUAMDIuymFWTpa6IOK5hLNM9aLz5xTE/a3jTIY
	 2l9hAzq/TlD6JN5buub6IlYvDldD3hmUkI1uHArW0YALqUBHBQCgST2QwXptGV031Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=;
	b=S0sBW2w0shrSI2WXEiD2YtDagaQdBmBfWfC1OsZwP3xST66JDaW71lLoiGIR9bWuy4N7
	 v1mHgjmURAmtagMBwHhmae9ZUvs/cfvVuqD3Nn36xKB2CmYA50pq4Qv9nwD019a8GP5nk
	 Es/5n0izNllq+TGXBN7YGtCcdeBRLci72eusP0tWxJ8FR//I+HORPv1J392iX+sr341dv
	 L78BTuJVeEctV6b4zmPlqcinn4B2xiYj48xkJ5z5Ewq5jT4FNYBWDUH2PKNqdhtzp8UP+
	 7mMciiLo5Kt/8p2O8QucijGxyV9df4pc3TxpPiJZ+sRzSMoRf0LcHv4EgBP3CPoFEzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wb33keXY;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B84606A33A
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 14:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B84606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wb33keXY
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso819768a91.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 06:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185736; x=1795790536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=;
        b=Wb33keXYKx7jHvDMOVfzOa1MjjfK3te3Tm5oMERAvMHZsJLvB8e/WZWzSP3sOwARxD
         HD+M34bOlaEG4qHNcyDpGYeyq1U76fJt/+l3KUH+iSqJNmo3lylDvpiAxGJFgbHBUB3g
         ZPPO6tb02p9YHPkjAMUKmxWFFgCh6eW70enqqn+agvVnmvK029VjXnoOrb3NrXNEd+Fc
         z7FwLu0MWUFKm+yDidOqtfAY6mENmBl32KCyTVVI7ACSqD14QRNI5HfNvmhR0v5A4ctA
         Ysv7jUuv0uDS38bnwaAjL0VmqGVSLfAMgI1NHKGpiofwDiBxLo80MnUVzsfAKMevqiHT
         rnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185736; x=1795790536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=;
        b=WkUAvoKi6puxs3bO/VNHKsiZvx0D1CHIjln9GirDeQXY6QYwv1vHc/rsMxhcuPb/d1
         8W8yfM9PKviy/AOoWMrGdcxyS/5GVY27iN3p47yyAPep+NuulBnSty0fDj/bfvPMbmb2
         bfEj2gbBNfUA5Pk81m/BMopPdWFKCDeQ4yZVKNabjw62lQgUbE4DslmW/luGk3WbVIlD
         0RklBM20PwIQtchcu81wbau+b7OwJxluuWLUlUte8jSebz+7UWJIKTVUHx6QQyiEB7FD
         2bqx50/ALS1LO1ReaNVXGjgZoOC2+c45bjNvlLYuTnKs64XkUl87hjJguRviteUKk/3B
         9I5w==
X-Gm-Message-State: APuU4Z/eV8KDeOkn9oP57HJaY9Cooz/FhptRe81Jy6AMznyQ1TTEgPBt
	jtnTICpnM0KNDg5gF1abjMj/PKIKKUa3RDv6JFCp7RxWCJjoDhDd/Y0x
X-Gm-Gg: AZFdTZffEd7l3NdWiOuUZ/mT10xvuJDjVpkCz2JGGnuSoGcX+/1p/CY8WfEZPmi016X
	9DedDviWmd2NkOMZlWCV2vbHPux5/l5Pv6gxCgXx2b5h0rbZmaSD9Gz+uBW3yJXWoQVPexx/4BD
	XnAuHDtC6oqHUwfZptMAVWVJxv9dKg0uR8zH6zxNKkWyxcx6nO7IvFbQHFeRHXtQBA48VF1kSmd
	qLOSUGUqOXJQ1uCvn32uZbYrDqvNhmNJqEwngyw2WS7WZk+RxmfEPZ9Pao02vl3vvaypgkC6h0C
	uyQVoJYz2rj0N+N9ixboieCWb7nMrTPCeA+Pr3M08w/D1xB+w+2O4idA7LAUNB9zsw1qJu5nqL6
	mepZcgDAY//ZwrIcOBS3vz/El/Lb7SmkkJzrS4gQSFRgWu2o2Lso769s7/YzQeI3yGvoF33Agsq
	OqJtkm3N13x7kKyAO+bzpHp1RbwQC0KPvSBy1kp/8+wi8JOdz+M2NliORjDoAWD57OBTyjhEphA
	GmbGhbexOP1dwbSmPLRKCH6DmZEyQ5uuDv0q6eB/z0qaPP/ngCT6Y2jPCp24XhwcdlVDz2bYRzs
	off/JLHx3SuMyQOTmZLcVN88s1MIqOObz8QHNq1YD8pcgqRPEReeX6ELntI=
X-Received: by 2002:a17:90b:4ad2:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3b41c99525fmr3214938a91.58.1795185736231;
        Fri, 20 Nov 2026 06:42:16 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:15 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:45 +0800
Subject: [PATCH v2 2/3] dt-bindings: clock: mediatek: mt7629: add RTC clock
 IDs
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
Message-Id: <20261120-b4-mt7629-rtc-v2-2-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
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

Expose the 40 MHz / 1221 RTC source and the RTC clock mux. Keep the
existing CLK_TOP_RTC ID for the 40 MHz / 1024 source.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 include/dt-bindings/clock/mt7629-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
index cff9a02e8302..ca325c21b9bb 100644
--- a/include/dt-bindings/clock/mt7629-clk.h
+++ b/include/dt-bindings/clock/mt7629-clk.h
@@ -115,6 +115,8 @@
 #define CLK_TOP_CRYPTO_SEL		105
 #define CLK_TOP_SGMII_REF_1_SEL		106
 #define CLK_TOP_10M_SEL			107
+#define CLK_TOP_RTC_32K			108
+#define CLK_TOP_RTC_SEL			109
 
 /* INFRACFG */
 #define CLK_INFRA_MUX1_SEL		0

-- 
2.56.1


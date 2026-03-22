Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FB7288C2D;
	Sun, 22 Mar 2026 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774166628; cv=none; b=uKLo0dnVOXlK690qeviSJGzXTpjHk6m/V7hbWsIzHi7fUPUBCBWl0B3c1KlmMVTJrZ40mC8Lgzm1lt4QR5RIZalgkcU+0PBPhE9y8GgJ/DkzNgL3FpFoedKldpbw2k3IbZcMN2tosyOvre1jJYy7NDfUqFsF6dyTNtrQ1yskFEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774166628; c=relaxed/simple;
	bh=nOwKuHnP5b4pP5nKigCa6Jg66CWkpdBNDAgdUOPLqQA=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=V835ScvJczO93ZlvTZNEASEwSw54CfNfPyHbEnx+RQT/hg9fKuv4HcxUCFCfdsqiem6uzP49K8IH+Tvb6eWjxN2P3msoES5gMekD4tkkoYvsF5eogYd2A1a4wu//wdyGoRuwe2p0/TMqUFnJViuwuq2v0BsuRbURV9kQqV7Ty9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Ybg+lF1L; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Ybg+lF1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774166624; bh=r/KYBO4Obj4K4oCVTFttAiIPYsDg4+nomEeK0QfxJNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ybg+lF1LnFvyfQnXiH9sUcUlxvdMp/kH+CBnuzEepa/y/+Q7rN0gsQTJFGktiA+q1
	 fwRL0okFHexDFIh/hFICUR+BLhuBI2VzwstZlaeFlYvPuOU1ctuWjj6Z7nNsEf7zKP
	 vQnaFY1zP2wAN6ep68hp9W+pe1ie8CobDWg++mxg=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id E78F8E1; Sun, 22 Mar 2026 16:03:39 +0800
X-QQ-mid: xmsmtpt1774166621ts9jpklb5
Message-ID: <tencent_09D5E459F58BDE54BD6998D7FC346A403407@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XDfIWje85BK8Q+de2FpNXINhB69YaDAoZPoI5pMI4cX3eAEkyT3
	 H9NIKPITVTPNABqNzpI4VeLEWMNwFGkoEsAscyRYOJOMWUIKYo8/UOTVBD37YADa1e8WRbKuefFX
	 rFJ6o4qE2Yz876isNyMZagtvcG79r7+ib6hqee/kqjgjr9WOEBEGKNGiUzuhTm+Dsnv2r0Nnd3pf
	 fpsp1bJ/eFfovmlkwcL6w//MryIw5BMJwopI2r/7APfmsOvbAEO9R97TmEf9oB77IKkHoEaauzIx
	 Aw+rxpjRir0IaiE3acYu5ZSps8GV5rRcsUkbUAFvvKesp13X5sgANoVjE/Vgyy7yja3D6XHM23et
	 tbNeosGsS9Cu5XMVgTAIloYEL/5Ki/EKXAINJJZFVTk2jeAi7ybcjuzAkxlcSLwdM/IOqAETy8oU
	 VLPXv4i649j6e/JIgWK8cCAlsrtLta1KPdQlXehE/1oHXDkTqLPjSmmshQC9QlpCsYOK4SQejW9y
	 6g6YuuSGzuLb+8h0OEOBOk1m+P6fxh8JeF0fj/395bIK7DM44GPQX5laJylV/A+jF8HK/MI4MD1a
	 9RiOODDhAbDSXJx8PTeSQIaCW7Zn4KWeN7FSuouk8+w46GaGRf98ZmDl9Vd3m8pKvtrpHLgYDfPG
	 Uzy16hX8wH/GxejsjJjvmnqkdQjXarewMto4qyatdVPoy0jZqmGJkTzaoQ5g45V36BZZNd5xCmd2
	 vX7RuRT3ks8oRBkfdSwn9hNO9p08KGszgv8JBBEhPFOGxSwQjHuyhhRjQjxrlhDK9O86K3DevD8N
	 GgdrNDRWrYk5g2yENHmKAScZ3VzLClZ1oZZdCGMI1hjJ2EP0qE2NdjhFS11CXB5PckE9gdDl4/em
	 36/7GFEvxw+O0mBRbJn22JW7Nt+BWS5LNAaGhxbqjtCYiLisag28m7JGW174Zjep+25HYpmT5yf7
	 xC0DMqindIG+CR1sXGZ9+67et6AtJ8xhJ90q5Iyar9KykqZ+0lhMqiDjuEprg22mCCZFGLqRao3G
	 zwLmw/Pj6ZfFbRFL7Ia0FFc6NT4dR89hw3wDSW6nL9eGwM005ivsp2vbMYiBs=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: wjjsn <wjjsn@qq.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org,
	zhuyinbo@loongson.cn,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	kernel@xen0n.name,
	devicetree@vger.kernel.org,
	wjjsn <2858482031@qq.com>,
	wjjsn <wjjsn@qq.com>
Subject: [PATCH 1/2] dt-bindings: clock: loongson,ls2k: add ls2k1000 compatible
Date: Sun, 22 Mar 2026 16:03:26 +0800
X-OQ-MSGID: <20260322080327.1606799-2-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322080327.1606799-1-wjjsn@qq.com>
References: <20260322080327.1606799-1-wjjsn@qq.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wjjsn <2858482031@qq.com>

Add a SoC-specific "loongson,ls2k1000-clk" compatible.
Retain the existing "loongson,ls2k-clk" as a deprecated fallback
for backward compatibility.

Signed-off-by: wjjsn <wjjsn@qq.com>
---
 .../devicetree/bindings/clock/loongson,ls2k-clk.yaml        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
index c07ad1f85857..4d70bc4e7a13 100644
--- a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
@@ -13,12 +13,16 @@ description: |
   Loongson-2 SoC clock control module is an integrated clock controller, which
   generates and supplies to all modules.
 
+  The "loongson,ls2k1000-clk" string should be used for Loongson-2K1000.
+  The "loongson,ls2k-clk" string is kept as a fallback for backward compatibility for Loongson-2K1000.
+
 properties:
   compatible:
     enum:
       - loongson,ls2k0300-clk
       - loongson,ls2k0500-clk
-      - loongson,ls2k-clk  # This is for Loongson-2K1000
+      - loongson,ls2k-clk
+      - loongson,ls2k1000-clk
       - loongson,ls2k2000-clk
 
   reg:
-- 
2.43.0


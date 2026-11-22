Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.235
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364714;
	b=KSZa7cWOI3m2h5CWdQJ53cO1YNsk3xlAShBl4ZYYneu1STZ+Fywq+pinFvuUeT+Yxu72
	 B7vJRyz3n24IVX7t3hUbI+AoeeHmWqN42wbmcC7/gz6UJVpwcpZpjWFQCdOgwdwC+4c/h
	 43Zb9RaMYQ47G2y1IR72gNgYMbSkjkXlEEmmvjmpQY7p2C3QwXBLQrurtdN1fGPBhDVNW
	 0tj2bIps7cTNcI2DHnFXJSrb5UNwRvBS1Y1DXkmUapiGHcy4Ry4vrVOmG1Hbc6PWXCAYF
	 gGVQB5yoAULQF5RExEoYFtU9DbRgqMn7IjGZABD+iOQv3a/me3oe3wweKXhjCJ0KXSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364714;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Quk+i+RLhvm+ITRHRSHRS993N/vU6wVhQmtQekP7shc=;
	b=MPVv2voFzqdABWIFooec9a97hEN+yhKcpk6F1stOq3GitnMiQmtFvB09SoWyb+HzN75V
	 XOv5TW25IM87ag+Mem1Y5CMj+Mjo7+9Q4Em2NjuiIbly1RuJbCSopLdk0vajnPStMeLaZ
	 S6ra7W28QAaTZ0BDBK2iN9vNrjV5oYJwlvqhECjyrkxPXJWjQWTUTLBD6jYQhEn77avkA
	 4TCqMcn1nlnSAnlROEXhHqXgn1uuZK4vKLezpASG87Pzi64hJUu49i0M8HbM1WQU6d5Aa
	 8EOTapDe2+M8ZE/bqBulsPXToB21JfukvE33wJmuRa1ipm4ak/KaN8MO+INZp/BbLLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=tqIjfMxE;
	arc=none smtp.remote-ip=203.205.221.235
Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com [203.205.221.235])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CA9606A330;
	Sun, 22 Nov 2026 16:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30CA9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=tqIjfMxE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795364704; bh=Quk+i+RLhvm+ITRHRSHRS993N/vU6wVhQmtQekP7shc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tqIjfMxEbey3ZTSH0VXE/dgT8KvyEvN9WlG3OGJzVcwA4Re1TK95DWpcfvae5nGqS
	 +F3EMTPSIyXDaIvqw5xCPaWQaACDU85tgXD9Bx/BqdmchT2u8PL6ppgUS/dZnhEh01
	 JztLiPFQr1863HCMI+hsxEqwfvgTafffXr8X7L6U=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 640042D7; Mon, 23 Nov 2026 00:25:00 +0800
X-QQ-mid: xmsmtpt1795364701tbdj3154j
Message-ID: <tencent_93FC4A7191B1BAC63C4DE9C2674660AA7905@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoeurQk+2RpOXQFHYlkNOJY/sjHlDSZGHJ97j+R4SUYeYhyX8atOZ
	 TgW8xfJE6d5YNTTM8+5XaDELGGrc4QZlS7OdRmqhU0qmfQycfaqDUsAk5iWSzig7UoIs05GHLzHy
	 sIKv4uX1rdeXJu46VFD07Ld500EmYQsHU0UvXpUOn16s11Yhp+9hmFT6OEz06CTa9/aqJpSC7jNX
	 BkH/PZTrKNysm3H2hVW2VlVUKVfT7ZlwdH71rtkKLbbyGwEdAbhluR6If84caQk+U9E8ut1MJBZh
	 1dMhtzGgyIFY63ZzQ0MaZ7XdRQcuqTO+5WA5aTGBA6R+CSIXfvLALvhIa38OfMv23EPlysq15IAG
	 MBxVJqcWgdrTr/iMkpzmtSL4C0t4jcu7lY9nkJgcHrwVSUxHCpa9nE3RK1oTKc6xYbcu3eqs9tJp
	 a7tCC1hdp2TcmS+r0oMovjKsGhc/fDpFrhJY12F5hrZwQ33L2wWLSIs97nyZXY3B5HDcRNK9V1im
	 MwmRPbPA6A3AxDRlNpsG/owuM6Et8v8naI4BKg0iWvq02PLV8VB5n9lwpxFGCsWKO7/ExfSsrRGA
	 zOTswc9f3zbWyn+gMCAN0UhalaNwWP4eDZ0OjNH6aQqC+Tjxeus6wIAmeufDcdaVGNlJfHWduicv
	 xlnM4uPkPoAa8jqiTXMDuYn53Gj71S/gQNs8B6/2MsuECprpaNNrKGyL7qQn2jbCLXlMaqSbkJsI
	 /bkE1JPmkkJO3lPUZIC8y7/hBHHZOD5eIUVU1Y1GwpsQNmgIosJsp4vS1bTEk/y9fjyxIGTSIAgT
	 HMISceI7WRCrG1MgNYLVcEVlksKQW5Mi0rpL8waniYdMs+18yb7C+cpwxs4Dmk11iMFUTwxibHTa
	 VBs041pBdrfV6LTP5lvGjVtPditl1kmxMsyDER3D2Dds9z257a12ypiR+T/2YqWGgrSZWquy2GD8
	 ZGq8S98/wqZ3bg6IG9a+YJ1BUuxeWyr0AB5VINSwWUR9d6FRGmzMyYSLQVo3k0/Mzgbk+fVWpx51
	 JDMPbaiRmheobmmI7Z3cwP6PEzSdVoOm+O5a1puTaYgOjense5NdkCTuG2/+tduHolIHpBQsG6ci
	 JAn8zHXcC4Takj5Ehcbd31SWITpJMA9qAOeApV7crIZwTvOaa4T8gmUdszssXK5HP5yhxFKxJK8r
	 SrHjAD/Aog3uCUfQ==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Xiangyu Zhu <1194781887@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Xiangyu Zhu <1194781887@qq.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clock: rockchip,rk3506-cru: Add SAI MCLK output gate IDs
Date: Mon, 23 Nov 2026 00:24:45 +0800
X-OQ-MSGID: <3d57f149a33d6746224ecbb235e3b1e6f29890a1.1795363509.git.1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795363509.git.1194781887@qq.com>
References: <cover.1795363509.git.1194781887@qq.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock IDs for the four SAI MCLK output-to-IO gates of the RK3506.
SAI0 and SAI1 are controlled by bits in the PMU GRF, SAI2 and SAI3 by
bits in the system GRF.

Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
---
 include/dt-bindings/clock/rockchip,rk3506-cru.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3506-cru.h b/include/dt-bindings/clock/rockchip,rk3506-cru.h
index 71d7dda2..708502db 100644
--- a/include/dt-bindings/clock/rockchip,rk3506-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3506-cru.h
@@ -281,5 +281,9 @@
 #define CLK_V0PLL_REF			268
 #define CLK_V1PLL_REF			269
 #define CLK_32K_FRAC_MUX		270
+#define MCLK_OUT_SAI0_TO_IO		271
+#define MCLK_OUT_SAI1_TO_IO		272
+#define MCLK_OUT_SAI2_TO_IO		273
+#define MCLK_OUT_SAI3_TO_IO		274
 
 #endif
-- 
2.47.3


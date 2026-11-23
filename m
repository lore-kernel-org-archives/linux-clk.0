Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471136;
	b=lLtE5FJMvfFjnVc/0B7ysBDltYE3C1+em99LPVV0m/GLzmuU8clTMNEIDlzZn9Gu2Ma+
	 ZSeheBSbPlV3TJlZo4mJbdpmzeeXpR8cH3BfGQZX330IK+bxDtzAxyLbo9E9F0JUqrPez
	 QcVu3136tUZiy7e6BJAjuKzd0U5T9uTDRXRRNqq2arCqorE4FcVWjeeNbONEklQdYOIYG
	 aD9ej9069AIjgKmwiZC+BTnYWAMtRRy0sT9tQrg8fmxDtOZdUSqXW4v2hAbsGbGlTpKpH
	 NO6kO0YzAQlUF+N0eaMBzoTUUk2gbJ+twBYGzsDL05Wdf2BkN+i+kYSmUnpxcfZR4uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZhJLNJcKZbLsY0YDb+VkHdgB3v5oyd24NiRj9juvaS4=;
	b=LYNi5+zA5quQJASXj34wu9mQkEKB5ib46t2jooi+DmRGfFto6sgM5bb6vF8VhTbIIKgh
	 aTA2fc/AxO9f4uUQPDm3vqzIXV145LllyXJQ9Y4I+0bS63qDHpAKbmG2c/Tx5ywYz4CrI
	 KcpB1ZOyLY9riyC1pCsZAIiTsyrEh2wRtI0rf3pGHCx8NqZzzBUM4jONBaSCPu0s/Lf5z
	 LFuGKebX+7hp9PUQpOMciyZLy8yoXrVn3kLF7mHdsJFDR4wHELF2LXvTKAwISBYGL2zVC
	 /WrYg2YBc7BEgN3CS0gQAKARM5gByih9w7Lu7BGJ1CcHMQ0hGNraLHcYBCxGNi8b18Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=psuYqVBR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JaoC32Fi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FD8606A335
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 21:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7FD8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=psuYqVBR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JaoC32Fi
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJua8f2973606
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 21:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZhJLNJcKZbLsY0YDb+VkHdgB3v5oyd24NiR
	j9juvaS4=; b=psuYqVBR1Le/k7GjYo+7UDgGpgVo68ddmtTiiEzhIPNF7FccNAQ
	bX+fLHICxApqlQl1RBqBTR+4eEqRUKBE3Un9CkdwAU5HqHPgIgw8SCM4+fncF7S6
	iB+8P/xJqMOjCdIFfnVEiCHkoHu8UGn0mPdNkuLbPWBhpBNQyfPMhCNLNgb75NeA
	CMNGUG/E7cusRxJ6hmL2azPxOzJ4qjY4zTzdhM5QZBDKfhuumS0yJNM+P66xLnxW
	SeAeX2UjhvXRropOYCxMvNBLS6h8eFlBKWi50kmXxtsIg9A8qhGHSW5gLZSwLdnf
	jY/QQ44I7+21N6H0mwpBTIf0/8sh/x8iGXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy03npf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 21:58:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94970ad532bso92272885a.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 13:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795471130; x=1796075930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZhJLNJcKZbLsY0YDb+VkHdgB3v5oyd24NiRj9juvaS4=;
        b=JaoC32FiuYQaWMAz6FufKNRNWNVrR/YM03bMA4w/Ds/6kAeTkMUb2aXMKaPHhEyYXB
         fb1SGibHkwf7jSEYFuQfBxpbI2ncMyOgi0T3SD122Qx8rantsXibnwxW7jd9MswOd6G4
         vHJmCaKRNPiQ6DTQQlHICMyu/LmttFxgk2XqiovtslDhbxhqwtjXfoUXSdgzcGyT4S4J
         LnD9JxFHWiU6gZZJ6A2nSJWzD2/yaZoM8ZOfMERcWQPr3ygcAWKj5PjaxGSHggfQHZ+V
         VAYNrBR+BAStFGdTuMQb7jlPBcWPaeY5lXxidq7rKFJnQPhiqbnAFp8NGvBYj+t/z10H
         7C2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471130; x=1796075930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhJLNJcKZbLsY0YDb+VkHdgB3v5oyd24NiRj9juvaS4=;
        b=KXl1KfsZsH+XXMv57Ip6sCkkPqTOBo0ZhdHJAamWAyPdWEq4Ffa6KuxChmV/XifpIL
         qzJkD7SrDySvQcmR83/8XcaDq87FJcb6dKW2JBhrGRKKpqLsR5xpne4EmOLtroRROdOH
         uconUqw57wgJJenXyMYUQXWZD5ARYkMi5lA0nYLIPlDGaR9I3kJ0rtB85txBYUv9hVmv
         obuA/UDpN+JNVB06nlPednK7vsLSULH1aF3gQspUOzhmpvWiMFBVVebJOzm+hT9rXkUR
         r4eq9W+n63pZBqiR3T5JTCfhSzVWbgkurII589JCShrdAnKjpoBnw+Z2VrK/yTL5nchD
         gbVQ==
X-Forwarded-Encrypted: i=1; AL+hErE4w8I9uesK6/+g+db3wtV5qHtCwRERfbddUsFY0sg/yudakeWypBEjpJ3Naw8RY8QyKCG6Ej5dyfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q0MkNOWCe+uaNWz36GQoLSrWTqbncRcoVJKQmyrM403lRkxH1
	5Ch4RZT2ps9qneJyOFricj+JOcUvS/vj5WgngBQsivRTz/YrH+G0OySfffHeh3nsb1GlN5yN71g
	uFUzD/UTDiIb26bnmD2EKs32yD8t1J6Bl0yN/0Eqbwb3o5+p2/FherOxPTTWGVu8=
X-Gm-Gg: AZFdTZfBBwhFXZgUNQWDNsGuHDPMSxG8OExFpCkSMUJXIRLkDG7uZtyl6uziR8Foi41
	eiiIw+0/8A0KCMGljlaQbcGvZE6B3DrX+puLG/vxRcGen4DSgWkfN/BXiBFX2KgE/6U+MkOEKPj
	fUv0EtOkKUC8YS5y/qxjVct9y3fqkdOHnh9rIxMOOjGlhs6cJPNTBjMvzFnpX7lZQckbDW8SuDt
	v37DuKUqxphUT7aQI0viC7GZZJWyfz1CjW9rGiioERnwnfMzw4nCKPYi8yI+40d8HBdISZUbzwp
	TBK1Kera2wiQk/oxNqI935dR6MBy41Bih1nIcRPBnOiP/Js3UTuUFAtHV/+uHhFTbh2x+jrpEgi
	+1ziyFzQWoSqU2Pg7vdw+HKTdz5FCnP4AAyBPKv0fi7hxUiZ1NRwLpO0ZmZqqYg==
X-Received: by 2002:a05:620a:2945:b0:949:6f9a:c049 with SMTP id af79cd13be357-949ba9e3599mr2252986885a.32.1795471130435;
        Mon, 23 Nov 2026 13:58:50 -0800 (PST)
X-Received: by 2002:a05:620a:2945:b0:949:6f9a:c049 with SMTP id af79cd13be357-949ba9e3599mr2252985785a.32.1795471130003;
        Mon, 23 Nov 2026 13:58:50 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm429427965e9.10.2026.11.23.13.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:58:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: apss-ipq5424: Drop unused qcom,ids.h include
Date: Mon, 23 Nov 2026 22:58:43 +0100
Message-ID: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=724; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ToRKlZq1pk9x4im0ALS1DipycJrxyesaHb+41j1K1NA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrBLcSMCvKFt8TdaQGFobh+duQ2nZMApKUVShJQ
 hvMrMi2DoGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawS3EgAKCRDBN2bmhouD
 1xqGD/9JOEyvFuni7akDb5dt1QXTR0np6H57ncZBagII21D7rcXRzD4+TIPNPmpxr3Y0PAzFVIW
 M2QJhdw6urv32mukZ7JlRyoKudF12/0pVOJohf7QUF/XEJ9QTkiWlU8iDSIPoIoQpvKghCkUgcS
 MB2Z9NGtevmHySoTConHe21t5EY8nff9nM2Ck/3H71jKGMdTiGuRmb4LU0AE43LFygcj0juYk07
 O9mcNim7izdYrVIWctleLqSjwlxyfzkKrWQZ0uqIDff8UYlbfjBCQGGisiQnA1ANzNe4XYUprMi
 /vr96/SqVH5eheB2uivofX0/pQF0BPSxRclRLIBXM5j7YU9+4mxstvlWimK8bQLO6pzdMa4lvjb
 a2Sq7VZETBYHGPtf+xH4WOiMyfSRVEKvs9iK04BS+0djvrvvDwuPBm/0+aEa3LLCNniUx1m6Fc8
 qBdOpnauMygZnniW/A7yYE4mXb7Gmij4YJTEHighPW3U5SE1QujDotFy1iuqlQkT1vvkGVQ5XSx
 tJJF67YVNP+6UCjgcrdmOoBHyt7kso1vTt8Wy3wXcFoxLuCD/a0DmKd/e5rxffQBSPa712f1o18
 fV/xOU1lzxXrB4Vsu0ECIMEzwhkA6sepwZJV4a5ncZAWCavUErLeL7oChEgF8G7g5tpz5fH7R6P 6lR7au6RYzNbICQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX1xm8aLueKcbI
 QF+OB0T19ajjpadzxXmy6In7LeI4olXlDOTo5mjQNumw7i173Fh0v0J22IfpsHD8nfA+UuRBk+N
 mgAEo+YL6zHiDIS/+e2vI01tWn6mZ++rqczSgZrdt86qYCkAt4bEkInlPiM2ykOr24LNX5BEvl1
 j88B8Eam6eY97g+wSD2WU0cpSR8gekEg8xqQ3mZdtila1yVes69gNixbP8muF2NcU9EfUwQORFl
 noznqgpt/NQrCHTypczPau13wGc/2ZEpE6xrhJQJy+M3W7JBaD1cu5ktQROt97h/OstLXFyapll
 VBnpEFTbDufgpH275Trh+J3YUSoG3/qJL6/7GKA8gi4bSx1Ib13vn3D4rJyZz+PItsI8+dpDuMz
 v5fCOzHP6LcKjetQrQULiJOUvpgBfRi/wN82Wzwh6af20471e6ezEaYI+/TqrHgxkiUxT37qLD7
 AfPeUGDYeueGqx84y0g==
X-Proofpoint-ORIG-GUID: Xv6Jm3q5VYVdHBgCY4MNWcFtbjebjUCe
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b04b71c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=eshxwDXe2nWDVXl-4hwA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Xv6Jm3q5VYVdHBgCY4MNWcFtbjebjUCe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX/ETq0NR7WSeZ
 3sbElbdexvzeBqVf5B+eU3SjN4QtoiTeT1aiDWb4p4Kn6HU0vsb2BYENPPJ8Vu+vZJpUBk932dg
 bPl1bfJI2R0srEyCi0hfa/twnmkcFBc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230087

Driver does not use any Devicetree binding from qcom,ids.h header.

Suggested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/apss-ipq5424.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/apss-ipq5424.c b/drivers/clk/qcom/apss-ipq5424.c
index 1662c83058bc..efc9e08614b3 100644
--- a/drivers/clk/qcom/apss-ipq5424.c
+++ b/drivers/clk/qcom/apss-ipq5424.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/clock/qcom,apss-ipq.h>
 #include <dt-bindings/interconnect/qcom,ipq5424.h>
 
-- 
2.53.0


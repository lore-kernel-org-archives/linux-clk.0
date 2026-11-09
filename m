Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184160;
	b=vd5FEdSPZ+7jM92WMmDGsYsU4OR9ZGzQB4GVbCO6NrIYs/UMosXGad5Fsh+CUHaHthPk
	 Bz2IiZg5Aq0mmiwcMLMTEfQCpwEqfE2PIp8BMOOZ049NlttYa0zQu9Z1GWPgkHG23T+FT
	 KHaAuXaoVe9Crq9scDpE9+e+HRKbOfWzCgFyJJxeuIFVHT7P68C34LY4j0b3l8M3tTWer
	 EQRgBnyHKWxKfacH2ieYBJcE0D7+o2akQtGpJHuszD1XTBA0rkU1LCmNph8eawgUoRM+F
	 2FUbRe3uAlQFTIU1ywwt4xBT/DhcvmOZ/MX0LJviBLeqs2gjPSTTHjH6S3eCNI5WxHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FMkbUjw206vKz1URfzQvJ+TU8ZKRTl3W+WHPyPa9fpA=;
	b=rPzLcf98xFWAPoSGsty7RQxIUb8gGxNUyzcZ/ksJj0zpWEOcO7w801q4iZboMasAprIE
	 sE0hsMCDYVD1Z8z2OWnoqDnxQNSS1aMl9QKcAsm4mDESdSSE/SH1YdkRWrV4vnaigShsi
	 cAoodpxd5vK/dcQ2z4oJSAxxQe0b1kKl4bjN05a4drQ51VWkDLCuSvlmi2YMEa33QhsQ4
	 ypbzmE3tQc6Bua5mAjxl1K7vD+0HakN7KRqC9eFInc4JmJftrTFvFKf/rExojNMcouDog
	 Cyif6xAhPZc3iqOzovyTanoZlO4y1Dcg15JqCGNub5LW9sScBEqpAwZ6sRRVPzHSMrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nr+rvJPK;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1FB606A331
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 00:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE1FB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nr+rvJPK
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a208d93758so3176265e9.3
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 16:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184158; x=1794788958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMkbUjw206vKz1URfzQvJ+TU8ZKRTl3W+WHPyPa9fpA=;
        b=nr+rvJPK3LgSefZHQcMuNoy5ys5xeLDvzoC9dL9bjp8RsH4nbUvtSXjE99yObhKnrI
         KVL569qwb1cNWqejwxbmHvDHlCCM9a0KALsd+kBI6FvzO7MIFWyCNFlZuDEIbHakXCkO
         zfIMQfOZFaAE3OJ8FnLCKYM7zUrDs21JikhpKZqp8aXIXjfaoZTJGEDD7K6S/o4SX5ax
         oowccfChKBzSGvGYv+RX3eVnKnndMe0cVvbZC/RuWGeZ2dWFUr7H18zUaqz5ZW33sdsS
         wL85GB4wROuyI9HV41fK5wDrYkNmeiq3h3ee4AveMIdzJFeUnF6yICT2l2yCcUrEu8vb
         jQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184158; x=1794788958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMkbUjw206vKz1URfzQvJ+TU8ZKRTl3W+WHPyPa9fpA=;
        b=XaRY1s0pXhj00/Byj5z3vOD5g7SJTJ6zYqpxdVvd6jQ6zzTJgUUIYBB3Hj3LltHvGV
         TVE8qkFH6dZ4On8HRC7uo38oK5CvRwxinmiVfkWMkPsFeTlSsLzblOCZIUYSA+aR5VA3
         ROKzEiwh1c8RRB9hKPfJ9+IrFP/Q3AMaTYcRi9e5QZcBNX/LNc43s0o19d6fD9CnBzFT
         ivlKdxeHtps46EhVAIHsZb0MQC7HQSBX8I3QrOGsZEHNDTQi5sRSTcs+Ba/ruyopHQix
         vdNLX3z1S3tdryoqofEPhIFBOzUtjUBMgQ4BTfNoyCQnfMNEmHPSjnLQLpx7g8BsReZG
         k40A==
X-Forwarded-Encrypted: i=1; AL+hErFcENH3szI5M9X96WK/eUZ/KOabo688AfyusL7tb97OkJZ0rVQ89tCx0pRLG5ZoQjZkZfFS20wfJMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z93HaWI0D7GFAl6v4kxFyIluTc5/wmUjU3P6DA/+DB0znooDqdm
	iz51f3uklzR5zrRdJ4pHkqmkjaxIkjyfP1d/voAc8jS6VbN1CrWUp8EM
X-Gm-Gg: AYBFou2MAZpFJz1OXHCAdJIl2uBEfGALNpoNXOCuHqlmuAK0I8l5LP47OOPyXL32F15
	rcSBTF6oH4YaqL5lQBxE8A0BUGGdGRUvIgKmMyW5qJKJPWjEBTMsQ5K/9JIsur2Z7EBQYxeTqxZ
	Gncu1j8ILi0AdDZXbBIpxqKkwOKTWx7V2QxH+SbVmwbM9LBQ28VCWetp3btCIi5Qpr+ejZqZ7ka
	oGyppHvvQsr6uTIsTZdS8c5l9Oe0YUUjJy0hIDtoO8ljiCauVaHmm+2ej0qWkmcI2ZBkmbuQrN/
	wQLhGSc4SubXqzJBunE7DZ8ouGUyGcn2rl2Zh1lAnYHT5FvIB5tB4N9Ne4zm7HaWkmVMmp5HHpU
	gnVuEwYTOfe4+7bpQFCnnHK3slFI2avKbR9UV0cLR0Kx8C19bgZMo4dM1yvbJOC0OAuYMmdrEdc
	m+tx0XnApbCQ05CwxKZPZHXwMKijeD+2lZRDgSwKL5G9PcqOj+9OHTVHqXJta4VtINeSMVN6AWT
	z5uQM2LWGZ7Ny+eQLjFClYO+je8zJ+FNLBRAMPFynVpbYba0BCxBqi8uPCpbWp2I8NKjkAvIFf4
	Z8i2OaMyO9vYCpdemHw1hJAA8Y4CsICNsifOHmrz
X-Received: by 2002:a05:600c:3e0a:b0:4b7:6aac:7406 with SMTP id 5b1f17b1804b1-4b94d762f58mr49204685e9.3.1794184158186;
        Sun, 08 Nov 2026 16:29:18 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm91295785e9.5.2026.11.08.16.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:17 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:29:10 +0000
Subject: [PATCH 1/5] dt-bindings: clock: qcom: document the Halliday RPMh
 Clock Controller
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
Message-Id: <20261109-halliday-clk-v1-1-20c3ba8be0bd@gmail.com>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
In-Reply-To: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184152; l=820;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=ra2CqCyJU+PQw7aYPTd3iwXLS2r2IgX39NQHfJ7L+7w=;
 b=2nnGBX79rTyj90QOmojpA8vtdMSBp8gr0IrLIj+ozjNak9ZQIQyO+HH7+ULR7mGoGIXokPJ88
 iUIUnzmfx4CBKWS7MIXWXCNck7cizjy6ph3FLkNDcHhSietAdpSWg45
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Clock Controller on the Qualcomm Halliday SoC
(SXR2250P).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 5c9b653bc2aa..72223566da1e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - qcom,eliza-rpmh-clk
           - qcom,glymur-rpmh-clk
+          - qcom,halliday-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
           - qcom,kuno-rpmh-clk

-- 
2.55.0


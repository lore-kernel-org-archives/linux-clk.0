Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864272;
	b=i+fqHVHNCcd9JRtXnKZzf7sbNeJ5zY6EPE8AAFU4a1ajwvdGIiq9asZGdcQASHvL2idP
	 PCKomr2Vb07X2mWr9ls7jGUD+o+hIcc2EpnoGwqu+lvAi12+j0tP6EG+TpE1+TdoDNgx/
	 XY68J+CgRwiqeqELgWVvH7DFmuRWm7hQFoJlx1l9598xvgE/bQoalDwjnSzl4hMjzD4HH
	 Lilpv4AKi5cHfyIkqV1cj8eiTRLuacvrby7sH/GVcw31MnPUrLXW9pvc+kVku0YLC/qqY
	 WEAvz2SFaIEJAquwvVSnuSJttoqr9jFz0Mx9eHoQ1gnAmXgiS0PWz8DyC94L70zRGhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wREO8yYhEaVkQGcf5OnBaEHgwkaJ4zZ//5ZqjDA9MsI=;
	b=iZGrw4347fz+nD25DegPnhHtbo9S4CC/VdvtXM4eepHJnCT4Ndq2Fd1LZBUTuuthEAG/
	 Dlz+dtoTejLG/ShYc6xUh+M8hmAqviETy9oc8dHiBmhX52aO78hams2vvu6HeMvz56qD0
	 3oFjcnI7xv80iTACJJR80gtlC9qGQPuauYyoRXE2x+Qe+q8QH6e04oMGq0LQ39c3wJrtG
	 titNkQoCqZl4Dy3SeC2lMTMZL3w8+mtTWaopxiNGjR4fOwcmCjndNrYDe/GCYkyUesdPM
	 T10S55xbpqOllgXd7DTZeSTwfqeYde0O1k7sl/ihUA5+vErfq5q8C+H2Tbrn4H8P6Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RV5akAzK;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4D1606A329
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 21:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF4D1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RV5akAzK
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso27208435e9.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 13:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864270; x=1795469070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wREO8yYhEaVkQGcf5OnBaEHgwkaJ4zZ//5ZqjDA9MsI=;
        b=RV5akAzKeEP/HsoNcLz+tuXg/klRUBB6/ajYSY8bldxfs0c2Wg+HpBnTCD/Y8LH9+c
         NNlt8M8zDTRk6x9IMeaNnXYBk2Ukh8FupoMFwapHXDDrsGsCkfnllkxfXzLWS40pizoV
         sauVGsgQDC5bTT8n+BJCAdFB0JvrXevd8l7ESWJ4s0tQwvt0MZM6b6ID1XnDE5Q2dzCO
         agazdYBU5OJ9N6j0YgByNIOIFUyEkYZsIG62Rn/LpoAt2mB02bD6aBzOfZl+yDeHTu7M
         viRJimN2nQmnxbvXfZ+sFPTNDg2v1NTHJIrFyJXRNXveqXZa61J3C0t6dC+tbqF8OwTJ
         EoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864270; x=1795469070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wREO8yYhEaVkQGcf5OnBaEHgwkaJ4zZ//5ZqjDA9MsI=;
        b=Ky1RIjCLc9FUWW+HtOChazE3ntKgc9f/Vi1iRWkeT6QNkH1ZqX4caYh9wbQPFM+pR4
         GJvGfpcZyv9ZtSgPBD59GL0Zd7Ik+whhJLhVGxtTP/PbP1xd+7WskZ4GUksxpG0mnhYy
         +JmnF6408x83BB26Kj+1ehugX2dBZ8JAfKyEaA1pRqXftMosm5L/v7I6saJh02z+h64Y
         AzfUa8NwqvpI92RO09UwXFO+HhgR7ddsa1GlsyQKJ1q2FGZlYEbwLxgWL7diCHkXQPZT
         fRfzMJUr0kLq0zJyY59guQ+U68RBopd4wRbitdSL4ij5DIrpFi3fXxVI0QjmdCS1ev0v
         mO4Q==
X-Forwarded-Encrypted: i=1; AL+hErEon42OjmOFWmIkjmBKLxwgArNOwnpf2IAFe3jWOAGefWSw64GW5GT0mM2RjohBIlDA5fMT6PEnZQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PWPaIdagRUXkM1znzCO6OqNrWFwQFLN7iYjcB7vfV9Q5H0JWu
	lL4I3rBKJPsXrTEite+9BgxsdrWJL52d2bdy7pU/D8/LRn8QYzXyc4ux
X-Gm-Gg: AYBFou3GW/yOZnod6AsRxOT4g4EgQZ7sYtIbri3wbtT/e/lSsQlEkOZtBQgOmEeJ8YQ
	olmVRVCuc9Dstql1sE18YIP4ItNYtcl/RgshDeF8yaxxMUPJZ05qpj8htFVXg/wMZ9zPDWTR3fz
	kHk2mo5mbSZX7tXrEPc9i6N/X1UuRJjDpwe8BDYGWQYrSrz4rAWsGrtmLa5Qfe/kd3A7Q+qQlv/
	OBZvZ43Ub9w7Xyu6bi03oCKYJgg544Pp2x1IwTNplg9GazfRN91cIHP5NN/0aFVfusOAGHuhQuN
	IF7epnLLfZsAS+pC8iaOWp9dh61RyLbAJzEpjy3Xo4JwRMwSZa77XtoGCJ2SvDL3Gbd/EfbdIH6
	8psT/4HW6XG/wH6bL/ixspx8Rp7OpmH6JWaHV3SApSMYsurVVC1IOGrrgqg9uVmZeJIkJRzk7C5
	AR9Y53IwKlCJp0siYJBWp6p7cak/1N0eYjAqr+6mIZsclRQtwWC9Gx4dp8fE/jX6HUVA605hzye
	3CqnK0BHGry0UtrsrZyrQ8YObFwU3kMHHDo6Sd334CceqEy9m7XNRPWsju7FV5XdgkvIZsT+77D
	yzdDf66GLRxADU5LtXU32ynVK3it6fxMpQlt3Rv7og==
X-Received: by 2002:a05:600c:4685:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb55a91e31mr246195125e9.32.1794864270391;
        Mon, 16 Nov 2026 13:24:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2f61c0989sm2414728f8f.48.2026.11.16.13.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:24:19 +0000
Subject: [PATCH v2 1/5] dt-bindings: clock: qcom: document the Halliday
 RPMh Clock Controller
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
Message-Id: <20261116-halliday-clk-v2-1-28208928da36@gmail.com>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
In-Reply-To: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
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
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864262; l=893;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=ZdWzIM6bnI4voexzohsmWp0z+avf5ks6mjxw3tb8aUQ=;
 b=9ADXxuWTDwY36Y5okN2pDe1MsHpuUDbA3CsIUSMxe7gUP2WuRMP+n/AfTAr9ogCLf1caA/cG3
 Q3NVDXq40X/B3Zshwa1u8FXTTp0InIEh6gsOU0Rc03SofrH+/GKLLA2
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Clock Controller on the Qualcomm Halliday SoC
(SXR2250P).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


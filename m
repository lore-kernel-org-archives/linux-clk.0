Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138462;
	b=v1ca3DdWpCNRBns9KCnnByxLVvh2DwXnTtjGdKFPbOHfNkPT7sUiduUR3dIXGvc4WxfK
	 n6qbnM78yZlXdfKa6O8KiEUw7l7it+pk1o39E+Sc5SG/yWIfr9SlRZD46zOlajUk7JsoR
	 07sO82f/h8z2yWveRrnupgh6MzH5J1/f6QdzKJrrcmjz1zhRMwgClMqavSXozoXA2lWXD
	 6NReJop19UXpomiD4EuyAxY2grcHIJpuT3XJMsmPo1Rq6TcoRvcxjDT3k17EFKiBR7RS/
	 Wd5GZkpBu1T4qYccvjpxp9j4bOVjOvHqPyU9Zd0V6/lBmsZ+JEAtq0GWvg2rdSo9HLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N8zDFvi1hwLlYUjQ4trPMNS9MFLc9+fuiBPttzeF26M=;
	b=kqJp+AF9R3/NExT3giDp9ECBQBBq9PFFGPLgnMbEzYYHSIATFmRSm5glnIBXvaHFNbtK
	 xnfJzA1Z86TarIVpylYf71sgkcvPjXXtLK3LEET3X1RPWx1whpGpd9LOrrcRcevzdaTkW
	 eWzbNOXHJ+DVot0OXxJO46Hxra0/O1pAPTiwgAcPahX1ugir5kpKiAZPoEERd6M8few3g
	 6OEOg4dBhk7pl9+kLHfOQcokAXgjbsu3uWGzmbp03kf1Nh3Z833w9cNBc7O1U8q+4odw0
	 ANBn2Fnhhonn0VqbUxvzYiflEl6XKeYvgBjznhEJ9eL9SQvwxYiMK8WWWZ7eNrfwQ4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kYDIvc8H;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527D8606A33D
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 11:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527D8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kYDIvc8H
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d21051042so7931266b.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 03:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138460; x=1794743260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8zDFvi1hwLlYUjQ4trPMNS9MFLc9+fuiBPttzeF26M=;
        b=kYDIvc8HNmoGxfswBqPc/bn3mblGxFo6X+NJ3L6oqsxEZkkr+m4t0mn2WCfFkisaZO
         +KFV1GKZrUODGH1jwVzp2dNnj5AQFg8tobqawkkepyMCV76jlsH26F4xcbj5rx8O3AwI
         9y9XDB7H4Mj24QgP7ASo8k+gnbTy8bB844IB0ftN+jI98Z6wP7IalktLXytAnly4TLSb
         tnegld6MS9agPwfzU16YT5rqdpiykyv6RmW0AXz+25fiT4fvHfhrKl7YCilvolQ7pby7
         KCM2rNosTVSg6+YYd+rjunPAhjVoIVGBUQnx6yoLGsIubCuL3LXN2LPTQd2tbfdK180W
         7Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138460; x=1794743260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8zDFvi1hwLlYUjQ4trPMNS9MFLc9+fuiBPttzeF26M=;
        b=1IGfZHGuvwABr5I5K+4GUIzUbzECamrTK80mMIT7yR4oEolx1HixnZ1TxGtgxRKr5E
         LCufjnxEv1zUySq3E1QZvFO7LTOJfuafber/GFEmdFwHjpIy+auaJrCW6n256LyFQ8gZ
         LDCZihRb1kSI50aMTOHOqbRBjgSQHfOsx9LxuBIAL6VFnENWYi7gqm7lsp/j7tqTnWIv
         TaMmAlAYVQF7SWn/3GDi/R3o2ZuQu1cUJz4v/BppCGhljANdMri7nwHxIZZTkAAIef1C
         PTD/JbodDzfiY0W82xOwdmub/hcXI81C2zROK0otqODibo/UuioDNUdI7j7Oku7sLkWT
         Wb0A==
X-Forwarded-Encrypted: i=1; AL+hErE+QzGsiRwWVyOo2PZomeySmTHHYDviQ21F+rcNW8spVsKNnwouWmUzGB/tt3TkfH/1zEZ0p5yAcdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AFectvDZBDMwGhaVy1FXqnqVsTNwe89gQJKdjXIZ3h6/uEP5D
	7VKO92zz8w0BxgaPqRx1TpJOPDWO1WvoW/Bq+FqGUhU99WhnpG36CapSA+jSzlsEIw==
X-Gm-Gg: AYBFou33Jg7gIytOpt9Z7T1JkBpTlutDqL9nOjYiwM7ACQwRRZpoEKMqnf7fF7qHwhk
	G7xkl69OQyPbxl39qwrnvZP2+yKDsbQOthyzlyCNsu7rMjNpM+TBgFH3tljyVecxo8US+d8weM3
	vIrFTTybuvac7T6mL6kPLKXHVwMZ1Fu84QRzxJpH2OiUJd9BRXNwvqHEI87/lgyP9fDAmERcDfp
	LMEieXRbUQ5u3U8Bs/mO6nZ17L+2MZ3lIPKfDkAKqTPqXZIHBnzjsrKLzTDrE3Zf4/ylSInMj3M
	u67jgoYUQQGIfjf8aOPuoVtNpke5qyDLWbkXnEgXaN0CPo91A7x0mWu7N6ZiV6OljdemL6wZfR5
	wmStUa/4CAnx6gz5B9wtzOIm+iw9UYk75DKGFHmCA36tFw419HaM+aOdI5NB7vbRyEktxxac0+g
	fNOduun9HKd27PwyKf4QrfAHNLUzEPyZff62LPpIXG5ec/XCUfdqNmL54nfI9lAl+d6SKmE/XmJ
	eKvWukWU9oWv2i47bNa9HR+c5laYGSH4Gytl+1YsSaykTa6V1b5RlctPaiPEcjillmhM0k7Nw5X
	tyYoeLxW6JaxQ3AyqPsfjncgkXIBHmxl20W+Q3D3HCwUh5z3sfeKSg5EN+c5E98bwKljKOI03R5
	goUvEGocju9JL9BNks1bz3nql13VrCUHYYoDDlSPHOGHrh/s154xwDMpCFYoTZd8eVbxkQIpmOk
	MciZn6yBAcDeYKtkzPQUoxEbLCa5UClBKbTObNXwWkSGBNNTuTUc6ki/dEWKRXYk9vdFVAXRGst
	yH2SGPID7/uHRWti+JPHwTPA+QLEdlVoXhUccYky2MSr6dFaq6ryLi4zyc5OwMT09G7W6bIC4/t
	7bagLDAr+p8RJb7Iy9NLQQZojUQY8V26xpHncS0=
X-Received: by 2002:a17:906:c104:b0:c4d:28c7:eb21 with SMTP id a640c23a62f3a-c4d6d4f9deemr95174066b.29.1794138459778;
        Sun, 08 Nov 2026 03:47:39 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f948c8sm56005766b.17.2026.11.08.03.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:39 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: robimarko@gmail.com
Cc: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	konrad.dybcio@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC rate
Date: Sun,  8 Nov 2026 12:47:39 +0100
Message-ID: <20261108114739.124995-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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

(Resent with the lists on Cc; the first copy went to the To:
address only.)

On Mon, Oct 26, 2026 at 13:08:12 +0100, Robert Marko wrote:
> Report the 461.5 MHz output rate so consumers see the correct rate.
>
> Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # Xiaomi AX3600 (IPQ8074)

On OpenWrt with Linux 6.18: the NSS NoC clocks run at 461.5 MHz from
bias_pll_nss_noc_clk and the PPE and EDMA clocks at 300 MHz from
bias_pll_cc_clk, with no orphan clocks or probe deferrals, and the
EDMA has been forwarding WAN and LAN traffic for 20 hours.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138479;
	b=hZ3/d5u1owkR8WfpGeJctZfbDxsXlAF1hdqlFf4rRjhWdwNR35K8/QkMsUIxVLOk2FW3
	 sBdJd4t617ovbgJIOvF5Cq8wCoIlTJjmilthOuIMbs9wkTOxACTZTfkLv6P/6ZIN/IP14
	 iUBlHhqwAoUxbF8xcdS3/kigtGDavNxqoz92VkrfdGRy3JG3Q7JTrKD8pK/ApbU6QzRAC
	 HDsViIWdFW+1r4JjQfyAlGsf/3yB6XMQ5rdJZANXuGFOfWedBpyCmZloac71uPdGPaLNv
	 bLFbJocHxGiwc00m9qXAIXhThn1wkRJqJdvAVNdmx3jA+mqlUY+kXbCNfjoGAsDKfnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j5HSt05fL/4yBExZjOaP02A8KU6P3r+1mP1SAucS31o=;
	b=K4oKrxhJGXjhMpzXUms1aIkNs3OSHsIENZd1jNn8cIa75EHExveLChMG/gizvHukzBQO
	 5+gCOuWQ93rL7Al0V6UawAk9kV+7LAoUpB4VoOKlnmwJ3JAGBjtVGtRhIHgS1aEgnfcRw
	 38MYYNfakXFt0ueQVfHf3OKBzIdlyoHPKse4XRuJ6Zj+ENz3OuGR02tSCG2RiS41qxcMv
	 Od8K04QTPt4tnK44TiLZnMCdAATQ290MsnvZDgUeVCoPH00bC+IKlrdoSTbhVryqNJCYb
	 1OAyKqU3jq/QJLbKLKIKudu0FGSUBc4BqqD7sKJTA/2c7PsnfVBH0oSytJlLnGSrE0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=efT2ubql;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2E0606D80D
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 11:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B2E0606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=efT2ubql
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c49c32650adso6759366b.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 03:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138464; x=1794743264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5HSt05fL/4yBExZjOaP02A8KU6P3r+1mP1SAucS31o=;
        b=efT2ubqlja0XxO/Em3E+kXD0/D0HEcJucdlAdSpR7OX8FUXvVR5wE7ncHvg+5rUZ+S
         JhtWb6OAHvzz2GDO8f0f2Idz6qFPo5BV98785hXrFsPZGzzV+R+VrDlmtClDJHIsGW4e
         4nORQjeKFQPUMCrN7Hz5pCnhwp1G4BbY5KqhPnnZx8YoUXfmp6o2Vxbzan134QaaFWkA
         R+yXwEqWlv/sdPBOQud39jaVJ447Nw4F3ZN9vGffDt8lZqSZKcSrU5jgoFECHpY1t7Vx
         RlRIb/VrwN2zybiNGohTXcsxMbKFIfk+4W9nVGtUy5e4haTMbU6jwAOw6NQjKBGb2vfi
         TiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138464; x=1794743264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5HSt05fL/4yBExZjOaP02A8KU6P3r+1mP1SAucS31o=;
        b=nLVkCCeZ0tQ2spv1asHVQGklOLBoLxhYWPA8JsWz0F8pyFbbwQoVeyLMkY8pjfN570
         OPykRYvPovfC7t19neH9J/N+kR/6Vv1qvB/3EqnAUP/je/1jfrNkvK52McejL3IiuKmA
         OA7o1RDxB2cWp3+GQ/AfLf2YXAemGn7rdl7mZIfpK9Chggyw0+pjxhhFFq6Jlas+O9vD
         5NZiRK41G1C+ZBeBbRlm2PvDHmtz+QNDPuHKOymu9YxCYVtWKNdtVg8RjPO99iZES6da
         qsisIlRgZ42JqiNl24M7pnxDIoCw46c5zUlyFY3jSWOMBoZcWdSsRooz+DL1EQlh7TNv
         uvlw==
X-Forwarded-Encrypted: i=1; AL+hErFX0mQTL9uIi1yjShtHK6Z4mY5kn6RaT1SWsoAxHY04iXo/5JrAR2pkEJDL/YjYx2XncB4DDWj2LAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0Iyx9CKIrus/kWTyMQ95tRpSeXS5TcycU4b0mdCzcT86BvXIr
	cGAGtpwR+Q3WxDhnpfP1t9lFhWs7FD494i8UjWHKh1tReYu4n+lJGyEtd1U/E2i4TA==
X-Gm-Gg: AYBFou3zJMROzkVD6tQMcIGL7wrt88D2F4kKV/Zw3HEAqRKDPWqtgQOsM2C81larT4/
	TNA8Z/U03ZJR1CuYaYwmSed9HG7ZmgC6m8jOpD1RiSJTlmoNW1kvTVJujs2eirnlEhPmDsOTG5q
	ceWubyah8+NoBlVTDnJerE0Hxp6BwDgsSwFCQ/v8QC8phXtHcYiULlhLsRjaim5zlWlaGPh4mTU
	pffq+qYZs4i2ORzAPCFq0idxn7/mGBeHSTBIcfOldTaAO7sr7b1sHwTNs/S2FkYkSuHx4trZvNh
	UdpBYfyNkYa05sva43H2m2/Z6+B44cFmk+XCYQ0sruYSZKxX4BTbh8NdrJPNHA/lKwCN7mkDQpY
	rvr8/WMqIiulnKjKoscRQ7cDDoDOCFk5zQEDaQqVTPXyd8Kz8GQ73l5j161YeXIvRxUrv57MpoZ
	I+XdHbqZ13Rkn9HtT/xdXfn8zrkdHyg7x/+XHROgdJmSIeyEmu73qE7GYcJq1JIXPgNQZ5BKL0n
	dfzpNy1H5jmYYC8/y/XG/kwSf6N8lxJh1CmiBy8WtorZ3F7F5QmEjJompuELTqV12DxvNKmS+Lg
	e40Bza5ABaIWLGv6JoCkOupuiY3ZZczkyKM9xr+ctzo8e7JIPZ5pX5gTssTrc9OzzxMJd6UXcyH
	/XzJlEsG2IajnESFrGejVsVVjLjRVtfvmcYrEU8vQd645vnr08P7IGgrn8sH+GnfBq1J6w4haoi
	I6P36lcSPEw9enAc6tG/MwzWNDsvNbST/fbMEj5F7hip4aGz4IGEc9kSvoToMqZpP+oMnMQIa53
	ugwQCCjoBdDq2V6aI/EC6eqZlpFzGHyPWkO9Wjm3PAudFQQtWYfn8VPrRgXCdkbFMSjEEPuwEsu
	+N15EO+CWg/NjhDZPg==
X-Received: by 2002:a17:907:ea8a:b0:c45:d8aa:6ae5 with SMTP id a640c23a62f3a-c4d6d7ecd22mr95115566b.42.1794138463689;
        Sun, 08 Nov 2026 03:47:43 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4751desm55022466b.43.2026.11.08.03.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:43 -0800 (PST)
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
Date: Sun,  8 Nov 2026 12:47:44 +0100
Message-ID: <20261108114744.125675-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026120920.1667982-4-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com> <20261026120920.1667982-4-robimarko@gmail.com>
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

On Mon, Oct 26, 2026 at 13:08:15 +0100, Robert Marko wrote:
> CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # Xiaomi AX3600 (IPQ8074)

On OpenWrt with Linux 6.18: the NSS NoC clocks run at 461.5 MHz from
bias_pll_nss_noc_clk and the PPE and EDMA clocks at 300 MHz from
bias_pll_cc_clk, with no orphan clocks or probe deferrals, and the
EDMA has been forwarding WAN and LAN traffic for 20 hours.

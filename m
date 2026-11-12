Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459421;
	b=YAfjayAfaUhTYyEkNh0X+70iZ/b6of3zybordza0F7rObdaF4PR7hNy22LzdPCTmPzrd
	 KTfJ6S3wCv8TMVBpF/ffq+JBKjiDinZoagXyz8q52AkjVLzdiI1fgeHs2cuA/HaRGDyKb
	 53q+BVRMYkDIyL2d+zyfoiTzIh4XXI3SZgaBkN7balW73043uXYm+RjtALqphL2FGYmSg
	 kuFXeAJObyHdlSuvREWMxUqY7Kyq628Hh8OkVmpeoEmP5idB0bfHBIB1vda9tP/oHuOlP
	 YTDAgPs933yTs94wbQtCM0LFRcFuUaVU1EBULJW6FYhp4T57RgHJDkRalVN9nv7m8kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459421;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:Message-ID:
	 References:X-Pmail-ID:From:To:Cc:Subject:Content-Transfer-Encoding:
	 Date:MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=z4D59vuyvcMbDa9Pt/pKTpe/EwgReKN9P8EsTN5XhmA=;
	b=wBR3GUvIqepmqg3lOeBO6aBknQGOsFOLA/Fv/39rwk7bt3PhJNnquCUNPtjKzxbkRrT0
	 dHIcONZnVvgde8dpXEKMQhm51lGQJLDyRkLes47oqB4KhPFvaEEuaBIdCEMlV6yUWl84c
	 zZDqfYmXdbiRDvRvqqts5TwJJivEGSP2NRobXSR2a4CN/gV2I8xhapD36ejtqYTlc6I7q
	 /9K0aR34299x4BX9rnZTNzzsoGkvMSB/EnG7x/cOTE7odM8F0B7nJgmbolxd1VFYUE/sc
	 SM6+18CjrUL2Wlvp/GYbKmjAqE+vIaXkUdvERvXtt5JZsW/41VH6A/CCF/TOCbWSaMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=brar.si;
	spf=pass smtp.mailfrom=rsend.brar.si;
	dkim=pass header.d=brar.si header.i=@brar.si header.a=rsa-sha256 header.s=resend header.b=D8itWCM3;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=OLwJAMcM;
	arc=none smtp.remote-ip=23.251.234.58
Received: from e234-58.smtp-out.ap-northeast-1.amazonses.com (e234-58.smtp-out.ap-northeast-1.amazonses.com [23.251.234.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25018606A31C;
	Thu, 12 Nov 2026 04:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25018606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=brar.si
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsend.brar.si
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=brar.si header.i=@brar.si header.a=rsa-sha256 header.s=resend header.b=D8itWCM3;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=OLwJAMcM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=brar.si; t=1794459419;
	h=In-Reply-To:Message-ID:References:From:To:Cc:Subject:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=b9oTyFk/rhLglEhNvK85W7391VaWqHkJc9l5PkpIFzU=;
	b=D8itWCM367Y3/QY0LSrMt3b+A6ypYnhGsyhncm+25A67r0OPAfAa3pM8n43R4qCQ
	rQz1e0vYFC6PHttPTrSrEmjauzAvKup62r1UTzxThHKUiyRZvaBNkP/P1XE5Ykn8WjX
	KzdRUUoMDK2o5OZo6nZgO/NOVTWzN+80GsfIyFPg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1794459419;
	h=In-Reply-To:Message-ID:References:From:To:Cc:Subject:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=b9oTyFk/rhLglEhNvK85W7391VaWqHkJc9l5PkpIFzU=;
	b=OLwJAMcMKujoQEi9JZXOvYIWeYPmT0kuYbgtR9ma8cJ0XQOesYAPMlkMccZOSC1m
	+46fauBdJqvRLN28OZURwRl30ZFmwAxQkWKy8QWCZ4bAP9TSgO+zl/7e+B2kKrOQATd
	bKtWIp8Z6WeviIYh9TfIkdYj8+vOqMWXJvEQLE8Q=
In-Reply-To: <20261031-gpucc-sm7250-v3-1-a903f8a375c2@brar.si>
Message-ID: <010601a1ce1dc3ab-f94c69be-c454-4038-9dbd-e970b1860da3-000000@ap-northeast-1.amazonses.com>
References: <20261031-gpucc-sm7250-v3-0-a903f8a375c2@brar.si>
 <20261031-gpucc-sm7250-v3-1-a903f8a375c2@brar.si>
X-Pmail-ID: <1794459418845.156917985495@brar.si>
From: Ishu Brar <patches@brar.si>
To: patches@brar.si
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, taniya.das@oss.qualcomm.com, 
	quic_imrashai@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: qcom: Add SM7250 graphics
 clock controller
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 04:56:59 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.5YL5VvZ+qZ0e19wo5UdMspzrKjMAjMWs/SlfuwHJq77JVCQWpVGwyETo7FaXf+sztO4bYMxF6WHssrYHSY+K7X2T1EZhOskwm44pQQStdKG0Jdj3d5ybzIXFkMTcPBXllY63oWIrFhJN26LFqLzTuHiXuqj9UCHxIuFhxi7IM0GCfceBHtKocmWdFsR9dK9X:1.ap-northeast-1.TOS0vxEE3Ar6ai29fkp2i/jb+l2iigajCGeLfF7S3sk=:AmazonSES
X-SES-Outgoing: 2026.11.12-23.251.234.58

On Sat, 31 Oct 2026 11:19:02 +0530, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
>
> Add the compatible for the graphics=
 clock controller (GPU_CC) of the
> Qualcomm SM7250 SoC (Snapdragon =
765/765G/768G), and the header with its
> clock, reset and GDSC indices. =
The clock inputs are the same as on
> SM8250, so the existing clock and =
clock-names constraints apply unchanged.
>
> Reviewed-by: Krzysztof =
Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Ishu Brar=
 <patches@brar.si>
> ---
>  .../devicetree/bindings/clock/qcom,gpucc.yaml  =
    |  2 ++
>  include/dt-bindings/clock/qcom,sm7250-gpucc.h      | 36 =
++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
> [diff trimmed]

Gentle ping on this series.

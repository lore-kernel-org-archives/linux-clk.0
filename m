Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596238;
	b=Y8j+M5R3O6Ti7eYMNk+ns4B4CXtgW6AfBrFVt50WZR3bwtjQcxEiI451OFtTPDgmmt9X
	 ISsU/gA4cJ45V7jmaI5b+LSa/l9QfD6z6++g4VkiW4MmJ3ZLJ8x0ingjmZl+NFzP+789R
	 ZdzQymIKJyOCsTfSOixU10z0euNnc5Yeb0F9Vl4Yhm+vCURzQd0/UyX418u0hDvlTbOrS
	 nfYji03kfsDJppSTeebJ+nYgnrM2Uk1uXhU2S+f5H3Fx7QqDZYcRM8W4XUIVmldForXg3
	 QTkne/Sh04H9KqIScgve1N4MRAO2foAA7xhJiU6OGXjAr23PxmH3w9TrPcY+e72JhSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596238;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=lk8pmFC0HkSbTOvdgKPncgyHmHzRfBH8Dl0MSEyxjvk=;
	b=TcAx0vyJtrd2I0Xg0PQVqExr76EUTj9+w08g6F+/GkgJ/wfJCntEjMbMSECIaNQX2H7z
	 SxFeOZ1s7sYaceqxNB1aNyosjqtGVnHXGCzRYCojEinHKdYG7Nno5CyW+gHHMbTJ4o9cq
	 FvnSHOupckUih2S5VANHZJRhPFLeQtH0wbLDKlCdH3a+57qC8wofYLImaRvi0vTREevxV
	 Hcub88KS7JXAFfhrlkIZ8saZJTM7BjPdTKZ93fIUEi6qPtd8WqGB2fIVU8QRSEjO3i64F
	 8SmqlDYJ5AtVj3MMmnPbN4n6WisMS41y3nuTFAndrXXG9Q/bZDwS/avcPCnjjs6si0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jycOHo7y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC70606A680;
	Wed, 25 Nov 2026 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jycOHo7y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9FC1F000CF;
	Wed, 25 Nov 2026 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795596237;
	bh=lk8pmFC0HkSbTOvdgKPncgyHmHzRfBH8Dl0MSEyxjvk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=jycOHo7yhYX4UtG9ejMsqGEUUJHWi/Zwt28in6z08Fas/A78M5qftwIG1ep+GvkNo
	 kiSgD8ee5pIS3yknWtfqgcNmDuW1aCQ6H2Ab2Td25dEFbEMB6BXeZsWSXfFEnNHASQ
	 WyiWVotn8GFgvc4hiZlTg6xZJ4bz1ew1641ncbFjAXiAiqlt8XOLIwYx3+8OLqmgJx
	 NHMR52+7+q1kkY1lnavaatx1sxEAxnrgI2w1V9p2fbxaCtTJXRNH7l0nviVwYYIdU0
	 ttFYdoL9Fj5EyEh0WH4Tjo0xfkEvKHI+JMz4q+Q1wjaV+TgOD6e5fYdyR8JPDRXr9w
	 p2vbrE7CqAg6Q==
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
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,gcc-sc8280xp: Add USB4
 MISC resets
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-topic-8280_usb4_clks-v1-1-be083a711eb4@oss.qualcomm.com>
References: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
 <20261124-topic-8280_usb4_clks-v1-1-be083a711eb4@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 09:43:54 +0100
Message-Id: <179559623452.14607.10423911391564308965.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 14:30 +0100, Konrad Dybcio wrote:
> Some of the USB4 resets were not initially described.
> Add indices for them to allow extending the driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  include/dt-bindings/clock/qcom,gcc-sc8280xp.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

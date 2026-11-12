Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490759;
	b=fxRmF2SpUb22mERUnL/zt/hXzfqo5y/1AKktYYR+hKUsMd8yR77gqwqk01UWl8W3Hf9k
	 4avfWTv0Y5YrnGfUmTnMYIK6GSFYqOsPG6fa5Q4Zq3zuQujp5JJoNN0hCauBcu3e7I1gN
	 Z+eG8skTxyHu+8ai0wyv8eM2/qayZxCS2OqS4IUgwuQd2mMu0XlmUEx4QDN99uGyqyy05
	 zooBD+w0s9dPn4UC/56PHYfV+Sa8IDq/H+eLFxLbSWaDIvNTabPa3Tc0HYIIAy10TKUnP
	 KnmblN2Q5Yg1WDl+vrm6iIFX2nzKH91wbwa2t+Umf1bfaYlPzL2RLRiQDeH01ceQIrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490759;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qFTI2rh6Wb+SXEbi777yJ3KF0nbeBHPf0drV1H9EPYk=;
	b=jsdMPjWA9vUxrK0LVDyiNgdQP1eCvbfw//S62oO8yb1wuLyA1eA1g2pewCqCoS+9eE06
	 H4t67IgB2lCSn3Z5KOyfJrT7jUu4LtmmeqJs/W3hwbxNhB30MFjocx38T3/KgYUNBSI5d
	 ZpoOWtl7kbE3O0qKKWrfEP7HxlxrEgrvYE8IBlOAPh5cEeXpzLz149ysHnPxDOaNU7Vee
	 x0aQ2jSjB97H/PJYH3N7Eu1QOQgQIFnvTJfTx/zKknW/mHOR4bULKdOEzG2A9mqugF6Hf
	 4V2/ucjeqpdtyTLnvHN9bJU/Nc8iy9IZ7MUlao2mkD4JPLb0CvpzL2thKKS4rCmrnfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mFlj9QOa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF2606A31C;
	Thu, 12 Nov 2026 13:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mFlj9QOa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA81D1F00A05;
	Thu, 12 Nov 2026 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490759;
	bh=qFTI2rh6Wb+SXEbi777yJ3KF0nbeBHPf0drV1H9EPYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mFlj9QOanzsMZ6WWagFbNGETSE2jxucuBUF6Sgkf4TdedTQA4cnALGAyPBtOB/TPH
	 3/ophthQSILY8jiOD0inuwNyhcPNBwv97yFF0v88VNltvWpl7wJYGfHr3sjla0cuhq
	 0qYD0j2E7OAItIZYGb3Pny8qtI4He1lEXeYIHMSFQ3OkVvneF+TtFm9HboMyCRGAhz
	 kaIAxK5ooBAovUykpgOWj4U3y756nK16mgP6ZazSSl9vv0nhmjmT3zdlaTy6nlkNxm
	 9q3I5R6M8lvdTdeuUhCprpxGEmdu9WktVn+ey9seAjRFmPS89silxVC0ugqNMm+lAk
	 WhsM4PGiN/Q8Q==
From: Brian Masney <masneyb@kernel.org>
To: sboyd@kernel.org, Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261112023158.118273-1-zhujun2@cmss.chinamobile.com>
References: <20261112023158.118273-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] clk: stm32f4: Return ENOMEM when allocating clock
 components fails
Message-Id: <179449074604.1202846.959369471118504586.b4-ty@b4>
Date: Thu, 12 Nov 2026 08:39:06 -0500
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
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=330; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=f7yy/zf1d5VX2fCP6jBnGVSYsuIFMB5qCte7qyiUQY8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+Hqy32yPIs66TYbE4Y8jS5CdXts7MD1BUnJyXe8WXl
 UdogWN7RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABPJmsnI0N9Ue+d5Olemo6Jp
 a7o5x76+9P3zl06fm/pd66q6j+HGY4wM95+HHfQI3LLf766ezQHhu/EbO4/wr5N37je7uMG4Rno
 iDwA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 12 Nov 2026 10:31:58 +0800, Zhu Jun wrote:
> clk: stm32f4: Return ENOMEM when allocating clock components fails

Applied, thanks!

[1/1] clk: stm32f4: Return ENOMEM when allocating clock components fails
      https://git.kernel.org/clk/linux/c/f2c959a3b2ba

Best regards,
-- 
Brian Masney <masneyb@kernel.org>


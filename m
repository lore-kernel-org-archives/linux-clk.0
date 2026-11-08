Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169478;
	b=UGAQ8LQDd8ZYmJoo9YjEWRAc0mTbP2sWOFhNfiQh0SnBKfF4qISHe810kFz4athPzawM
	 eeqCD2KiZBRULYDi7AtZgEPau65+ZoxgvSRO+5wr04JWs8UK38BQMUOOJivFkSP6g6HCy
	 +mtCoyCE/OKdfNUcPrs9wymfqEAUGRSHM/b3CCv5kGlY29r2AXJrek7I6NEJzhobItoG5
	 NNicqhAzFENkUmlwlVo67aOOn/8znuDSwnqr/1tzgHySKNYMVkUQnRmtVswIO+eDa+oda
	 qANl8g/deaoh5UwEDKsAqXYuxnH4svbwOT2tp3jx3FJwmHKdfe5QGQUDyz6CKkVfqzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169478;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5c1izOgqQsqYqZoaqjAccBDA/0QPLj0WU1P9GweWkGs=;
	b=KnSJOBVigS13nyUFlnNvcJAAaJ8xRSSryUmyeBb0o5aXLFpMddnMrH5lhSBYaRHfsjHC
	 U3SPDI+yMHRYw0iYrvFdN9dbImR0ud+cBo/G4+OKeH6TpGh4g39vFga4HYg52o5Yw0zht
	 3lrTL2fo8o2s9m+E/a6+pcBX8Eme11ePKVGvyI9bTE71Zf9nGJiz7hoab9m1sQKjsxrZx
	 A31Mv0BEjD6hegXnQIjY7GD0gmhSWk0RrZjlZghImLD7nhTPhFK+RLu8ggEDKAQUPAt3c
	 uI7Pw/iq30CPBuIw5BxWgCSAiM6shxq0vFGMOZHhxmqyDleeZKSc3VGSWV7rbi3LP1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=owMY7KpM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3E2607D943;
	Sun,  8 Nov 2026 20:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=owMY7KpM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F351F0089F;
	Sun,  8 Nov 2026 20:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169477;
	bh=5c1izOgqQsqYqZoaqjAccBDA/0QPLj0WU1P9GweWkGs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=owMY7KpMZrMQBttY0jyvLvSgzGUDIPrFpYEoLEgNLYIXGI75BXWMJczhDYMv1vZBq
	 ru3fZvQ0fH2rD4i/MvpEvlwXOr5aHF0bx6sG5vw881ZXz+CCfAOfavpj5qey9QtQge
	 dJ0uZSyf07kLRuOypsuFT7hvmJ4TLhU62mEPHcM6HRo2IbhLjBRL5KocYRQXWyrX3t
	 JH/u5O/CwxeN6jVljMvNB9brJk3qtQTWZCZS14XvsZJpbIpon3ET9w1NsYeWj4zASL
	 sA17xR4qM8/Fq068o+Hx2sS4QL6LMStv8BXkZpK7lVP0H5V+7knUc5VZOwtf9EMJ/Y
	 pP235QP6lWd7w==
From: Bjorn Andersson <andersson@kernel.org>
To: abelvesa@kernel.org,
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
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>
Subject: Re: (subset) [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC rate
Date: Sun,  8 Nov 2026 14:21:08 -0600
Message-ID: <179416929481.628393.14693210731870428357.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 26 Oct 2026 13:08:12 +0100, Robert Marko wrote:
> The IPQ8074 NSS NoC bias output feeds the GCC NSS NoC clock without
> a divider.
> 
> GCC and SSDK (Qualcomm vendor switch driver from SDK) both configure that
> clock for 461.5 MHz, while the CMN PLL driver reports its parent at
> 416.5 MHz.
> 
> [...]

Applied, thanks!

[2/4] dt-bindings: clocks: qcom,gcc-ipq8074: Allow CMN PLL bias clocks
      commit: 969f124be6cda13ea890e7330c984c6fdb512753

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

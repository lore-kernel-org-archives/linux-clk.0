Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839920;
	b=1r8NJBLPEhs59VfD4uaxaI69A4qO5DKL6A76saVijYw3x47/kGZBwtkdGWFchFZjCgMX
	 +wNBjLor9kOQxBdZF37DmcrCejnBavwq3JU1ejqqRRbZlqj7R2LlSQYma5YNRuNoLfq17
	 j8Gg7cpmOJDrckKqY8O3H2cPUBQX4bG4O3Kdmfi4ZKAVTqf8Ue6WnzrbIhYhFSVf645JP
	 IoobORbcPWmj4B5BYCRUUHYeZ+xAiYFXT+MkeCaKS42SqLRTsShksWwKXiMsmsIZakKsI
	 ls/VCcOgIwv1245jkQrLuUHPQdKGl37yc4gb6nYNKihS49etfmG8gC5dPruk6LytJzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839920;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=09BV+hqcL3Rm0OXqTQ880vFpJxeEr7SoQ2J0McyvbWs=;
	b=TTkMMVwP6MK2JmdqzoffTeknW6YZZltfDeRq2scnQh6Gxc08uK0e385gHf/Y9Cvu4pcx
	 tOn9LUXMoCmgFw5pSq5DwrMYK4xe2Pl0aeuU+aQpIaK4sDbvjk7zcfYcvsvi4NrXL6eJ8
	 x1ZeL5cFJqWewo1zTU/6R9hCIekcRXQ4nkb7eOh3iKT6iVyNFatn3e1jeXd5EMu+C5XLE
	 gJz5QQwZtuvF3HTv65rIdjOoceBiJpsulX6+4P41oITcYThiojkzZiZNFegWc0bjSLiO4
	 vak1j6YFFXMCOsuoB4EGeY9QL+j6g6lEwyz0VrsQyTkg0vJT0o6CHULgTp1qpT74caQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JMsfLNf1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D91B606A32D;
	Thu,  5 Nov 2026 00:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JMsfLNf1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C061F00919;
	Thu,  5 Nov 2026 00:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793839919;
	bh=09BV+hqcL3Rm0OXqTQ880vFpJxeEr7SoQ2J0McyvbWs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=JMsfLNf12IWclRvmQJ2jgT/ltqd2Z3hPUysjLaC38DsmY8JkyDTMWogkFRJIx1p2U
	 ZrAgd1LnmDyRRDHyEZ7vYpBaIGztOYHgPbp4DnHYxO6tGodeMOt77GJVMXb5FOTIfL
	 gdw6pmXpEKjZKs3wlMDCLhbNuJ5TCURzwWulbGhrxstzdbk7pkAvkXo4mNPbnhdoak
	 HfVrut5kmxMgDffLQTIodB+Es9w6aOhTrdEcL/3RuG7D+67vXbImtpKyOOoGH2WcHV
	 lH1OEahYTM9ez/U3mUFC9ShhQgGaWq1msrszgtnGxYcl8o+ZGTka8j69W90AnUl+8g
	 l1jac7tqSc5Bw==
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
Subject: Re: [PATCH v9 3/3] clk: en7523: add support for Airoha AN7583
 clock
From: Brian Masney <masneyb@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261012115954.92718-4-ansuelsmth@gmail.com>
References: <20261012115954.92718-1-ansuelsmth@gmail.com>
 <20261012115954.92718-4-ansuelsmth@gmail.com>
Date: Wed, 04 Nov 2026 19:51:40 -0500
Message-Id: <179383990045.753844.10214609153829963774.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=552; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=8obmT9Ek5uRGMiSpJsvaTQa8P+q5rlRMtRkXS2ERjrk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJeX1Z9YbvsbX/Ittv211k+sia3Vwh/0nAvKt7uwfo5U
 01W1Eypo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIkkKjAyzG52cQtmmTHv/+EF
 9//f6CxdLbBKXJupbdX1xdx3l+lP2cHIsPfgU7PpHaZrrp056c60ZoVEUaQMw5Lb82J3bn1yfo6
 SKgMA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Christian,

> Add support for Airoha AN7583 clock and reset.
> 
> Airoha AN7583 SoC have the same register address of EN7581 but implement
> different bits and additional base clocks. Also reset are different with
> the introduction of 2 dedicated MDIO line and drop of some reset lines.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

The feedback from Sashiko on this patch looks legit, and I don't see
where you responded. I think some of those issues should be fixed.

Brian

-- 
Brian Masney <masneyb@kernel.org>

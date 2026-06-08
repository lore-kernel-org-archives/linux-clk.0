Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7798E3E2ACE;
	Mon,  8 Jun 2026 15:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931408; cv=none; b=HPQjpxrAzEG5bBT+PKGWGhwBKfQ15i2nb35yYv9o37Tdn6AMAJmsntqEnkFkMMTtR21LMVw6Ro4e9ipxb8V2KVKGztMDIBj2TnwmM8RV+F3r8xxErcS8mOSZpSMtHc8wEmYYEWwExT2P1/I/cu1VioKyr+g5cTxkIZ4tOpiSCTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931408; c=relaxed/simple;
	bh=P2gGEHo2yYAHEcfjEI4xd6HNMVzHuLgNG/5h5k5w5WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n8cZNoOmG2rsbmvFovQa5jHQFWeDD9Nw797PjMLbiEhPU0amvpQlrkiCao0/MEOBB7eg8kllvgveKJ5A7vrMtkCwZ+eynuIEZRSnisgt4ADcA4UFM3UfyM7dLGUFaoemQQhMMsWFZxUFBTyrP3fX2KM/0j4CQSKIhCgz36bDUk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsiL80l4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsiL80l4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988751F00898;
	Mon,  8 Jun 2026 15:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931407;
	bh=bStjq+9PuDzLyINJ9Q+sb2GN1pSP6XGo41p2BmBZVmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MsiL80l4QRFsE5813QyCMBoYfoSL+ejoWRDbe1ktnJBEj/4Vwaue7omcBFxGYBW11
	 g178t84O9dDb5CM7BIN7JR7rlPT4+Ucsiod9dnrFiA9HFZhlVqXclO89yFVw9XKxWi
	 GAEBsT2+lBDXnOOpse6+sLmdqa/uvL8Vt1zYNhurFJNzHLTYG4BJ7tyPBzOZnAEJjI
	 8y3rkl6/uqQ2wYvcu7ppSpnvqHWVyGzkQ5EEOHc07PBKs7MCc3cDB1jepIwKswPnpq
	 sBqr99mWdKyno90v4DcVxdi6FiVJTjG88RfVJii0P6ib1zIJdFYK/2ZLQJQsa3+cKg
	 BnC5BmmnU99TQ==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	Phillip Varney <pbvarney@protonmail.com>
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: a53: Corrected frequency multiplier for 1152MHz
Date: Mon,  8 Jun 2026 10:09:57 -0500
Message-ID: <178093139445.244194.11455222180094768538.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605005502.313928-1-pbvarney@protonmail.com>
References: <20260605005502.313928-1-pbvarney@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 05 Jun 2026 00:55:45 +0000, Phillip Varney wrote:
> The 1152MHz frequency entry for the a53 currently selects a multiplier of 62, giving 1190MHz. This changes the mulitiplier to 60 giving the intended 1152MHz.
> 
> 

Applied, thanks!

[1/1] clk: qcom: a53: Corrected frequency multiplier for 1152MHz
      commit: bb56147ea9fce98ebde1d367335ba006cba61fbd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

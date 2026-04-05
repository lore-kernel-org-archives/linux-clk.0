Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E5B35A39D;
	Sun,  5 Apr 2026 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418040; cv=none; b=FVFOPVBhbmViJz80wIqEwe+aZVX+2NgFo64+Y+gy6KvPVyZttcaz/Smbj/HauGAdqmNRN+WAVBO8GCTF9MfraS1rqlK1Wog9/4yI0TtN4T9/Zp8f60eIXbPLftiw52DwhpuKrPBQlgMMMvM/92qMvY0IwmG/FQ4fvaNrwVAjmfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418040; c=relaxed/simple;
	bh=XqdmqAm2OIDnsNO+CBfgzIKx+eSJjPupbRcr6ZLww8Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YvGTK361p9LNIm9p6VS9NgmE/eYN/c/ZL2+WM+Sq9gfVGQTkbKRsBDbmQlgau/o7m89n3A25ZcYZWl65XUI3xd1wKVPlzDDVzvEZ/AgznTmTx+ezpLn19ZHFQu5f7C/tmnWkL9tWNl0iF4UogEEckB04vlIbTmM4rq6Kr1gk9Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=puO389BN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="puO389BN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F87C2BC9E;
	Sun,  5 Apr 2026 19:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418040;
	bh=XqdmqAm2OIDnsNO+CBfgzIKx+eSJjPupbRcr6ZLww8Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=puO389BNqKCwtXGKaku9DnoWDgntaR+CzD9JkyPe7pi7ykyeazQhLZxElf3iCsJz1
	 CWQfd5bnZJTfVVsAvHwa9YjBQHzSR5FopvY9zz9V6/R+2ZX3hAbjmlJG1Wh89xSerl
	 OUUTJC+/gyLP3MoJ6U+56fQ2yX9J5aYptBOyvHRkyiBb4KpJ7cNg2IGqEy+ycKW4i8
	 xX5qpAMLBbVEhjofEcj4fJPKtXirdA5+PQQGCcbtisAquyqUcOeAp2izOvcueD5wW+
	 5NqMeHhc+GGbRlKgzTCsAnYD4JoI3A1J0ofr1EJO8XWDXLH1EsVtjZ4D4wD+KP6+6p
	 kG3RAZuDS1mEw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: videocc-glymur: Constify qcom_cc_desc
Date: Sun,  5 Apr 2026 14:40:20 -0500
Message-ID: <177541802156.2061229.7459535185039916561.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 31 Mar 2026 10:55:22 +0200, Krzysztof Kozlowski wrote:
> Static 'struct qcom_cc_desc' is not modified by drivers and can be made
> const for code safety.
> 
> 

Applied, thanks!

[1/1] clk: qcom: videocc-glymur: Constify qcom_cc_desc
      commit: 03aa6ed7069f4872333d410303ae8dd341bb096d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

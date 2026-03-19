Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565012FD660;
	Thu, 19 Mar 2026 03:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891101; cv=none; b=WVfZlpOL8c+KH3cZsfT9xEJetz4U9RSHz3sDPu8t/W7fnKd4kdJysIYqnoDegZp8cvNIrYhlT9Oxq7CygFqnji81HKc4EChjaxMvM8wKO42meZClnhxjGoka7SXX76AO4gcwft/y0UZSEPLqtFv75QA/DJht5e2ccBvHCrkUviM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891101; c=relaxed/simple;
	bh=YcKhEXF/l+DpmNjvLvuIQ/5t03uff66596L5REl/04g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OxNZ6fJWDzD7JeBhUIIF21aYxPaBKLseBMg7P9lRHCWNGrFHeZE6dT8oayihHVP+GVDFw3eLBjA3zxRO+D5XhUCF6r0Zm4WEUA8DAtRkCm61ax5Ii7hmwPx2NN8owKiTmStF6N/pEBaUmdcxjMnNEpDMRN5p1CgygLFsl8Zu4NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGLsTdmR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGLsTdmR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C52C2BCB0;
	Thu, 19 Mar 2026 03:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891101;
	bh=YcKhEXF/l+DpmNjvLvuIQ/5t03uff66596L5REl/04g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NGLsTdmR4+OyfbTrt5kzHm0FNPPwAUgvE2hS902pc/XvHOJZlg4fT2PUqvTZmy71e
	 1lJO509Q8JoijU76sid+wUMYFJ/F30SRRCAuFJWTroa2lThA+5MxReuPV5V+V6JdWC
	 q4R59I9C/VHGEPog6/lRCQ34ovOmgzZ6DCO1dOFBxkZXhqohabPWb/HZ383kzoDlBJ
	 JdL6NMCeLUol0EW4fu2394wQGJ2F2D9IWrL/Wa6ZICtXQirYpYCtCWL66HAiuw+lzi
	 eCmL4bbbk98WDf1JkV6yiPH2ggyEKCY2EdlwzadimfQmM+Hxwr94HhBXc8IA9w0voB
	 /7iBjbDD227qQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: videocc-sm8350: use depend on instead of select
Date: Wed, 18 Mar 2026 22:31:18 -0500
Message-ID: <177389107882.16612.15808664836927022048.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313111018.130068-1-mitltlatltl@gmail.com>
References: <20260313111018.130068-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 13 Mar 2026 19:10:18 +0800, Pengyu Luo wrote:
> Both sm8350 and sc8280xp use this, on sc8280xp, this would select
> gcc-sm8350, we don't neet it on sc8280xp. use depend on to fix it.
> 
> 

Applied, thanks!

[1/1] clk: qcom: videocc-sm8350: use depend on instead of select
      commit: ecaec77148428fd372a57eadbcca68845a8c68f7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

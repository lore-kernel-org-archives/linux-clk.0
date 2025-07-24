Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05771274666;
	Thu, 24 Jul 2025 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753391916; cv=none; b=Wz80CQsNmWs1p9C41dlnxFuc4PXaj+Yxgf5NZsKRkpSW30sTYjWIg+QTjPKVGBFRYJn+3IsZiQWaD2QxJaCPYk3RXoVvlZkoHKMK8GAH2TM2NivD2ac/U4W6lpJqfui2GgafgLDeE4O113qC/6OkoYiBJJT03BavQmy5Ah5lShg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753391916; c=relaxed/simple;
	bh=IdtfimAfbnNoflFww3wHpTZAa3JCqSHF6qHluxoM+AY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VtjmJrkXuea6nTwDjeCr6tpK6vf6SRlpIKxqB9ArFDaRo6mefddV0ExhJF6k4XiWWT3q3KYVCseKi0Wra/lSa+IgHGBY88T+YOsbCD2JyZKqBORiI2rhIUt3lA8yQ7dZfmHlhQVPmFy2sief3CiVBT9xQc6y85V0GOL5+SXnQpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qBuEp15A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qBuEp15A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF81C4CEED;
	Thu, 24 Jul 2025 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753391915;
	bh=IdtfimAfbnNoflFww3wHpTZAa3JCqSHF6qHluxoM+AY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qBuEp15ApxOomIh8MRz8TTIrolzvjwiIC+cs7NxzalnErdv6R7ZKg9tRNCP2Rqh+E
	 bjcVZL4+xgm3T2ljWQua4Xj4V1luh/wzvwIga1MCyNhTGQRK7XvcBkosx5vt6W/Y4+
	 nzN5lXkLFQk8cb9xnz7sVnCpXBI5PbT7P7u4T/aCKlLO4E58YXbMR+sMXEU1tFikRU
	 rXaBwdxchLI5LI7Veq7kueiulurmWX+VYsH99mYio6TkWgdbMGEEbb62ZTynIqL4qS
	 mSPMoqB+08774dcbilb/j7YvodDwBcJWe2R3Fx65f+BGIxKKxOOnNQ6sQ1KFa6U0TL
	 msjwhq0lpJvhQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250630232644.3700781-1-robh@kernel.org>
References: <20250630232644.3700781-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert moxa,moxart-clock to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Thu, 24 Jul 2025 14:18:34 -0700
Message-ID: <175339191465.3513.9610109190156131662@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-06-30 16:26:43)
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next

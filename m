Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205F14457C4;
	Tue, 11 Aug 2026 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456337; cv=none; b=PX7tlyPeiqAdGoN5PsfqUdHe3aqRneHe8aYHIl9J/75WFv8rz+HPYjBOxvKkFwZ4+ykqjPXFwlPi2SUjFlaLGWVzM1Ez1/T3AJ9nA2Pv9Hfb8jmJVFoL1hUk1FrIjQYmCsc1LQ+HM/QzmoMe8ZmRiYySddL5bOXdi0jS+uvyWMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456337; c=relaxed/simple;
	bh=tXzCeYYh8nJGKtQpwXejyalkIJY2K83AunWYKEYb1rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vyqlu5quPPdnaELRrR2ybz76Vhjw2vVTCwm/8TmyouQzYnWRE/QVmuD2nX0t5WtpqRUy9wxal4sierb1FZvUbZyKzdkYiYCvayJJBJ/gdinBeaaEd5DJC/TElIUKTGNkPNnjO3Rnlu38eAMK2qZNi5W8+piiBYDtUW50QQNdzBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSEuZbNr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSEuZbNr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1210C1F00A3D;
	Tue, 11 Aug 2026 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456325;
	bh=phhTzL60K0GYV8Ub4xF5Zw997M9eAMmsDvtg1hwuGlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VSEuZbNramUZ/vh5AcIst7DMicGcUY4lthiLgHZboYkBEfgwDdMmJzfhg/Dfb88sr
	 zJJc8DmKlrjaH94MJV5KZ7DqkTPIbnzCTZFsFN8ayYTbBNrrb+SapZj4RHOKVyYSUw
	 M9iNrmsQX/MEf/EGviZJYyxLea0bqMdYr+D4dYTsitc12lb6ZgyvBvlFKgG62S8Kf9
	 yBWQfN+gQ8CDKlRn+3yf+lPXYAHomfE+89f1G2DNOi9PBwLunNcQArzMrt9g5PGDAs
	 b3rj03EMSO//IsP8JwC9GD/fiueaSGbiVEe2bo5/7qoDdpIK3zMXRU6DIywdEyDO8d
	 DLshxKWX/FFjw==
Date: Tue, 11 Aug 2026 08:52:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: Correct white-space style
Message-ID: <178645632389.2072234.6959201411927643233.robh@kernel.org>
References: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>


On Sat, 01 Aug 2026 21:55:41 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/clock/mediatek,pericfg.yaml      |   2 +-
>  .../bindings/clock/st,stm32mp21-rcc.yaml      | 140 +++++++--------
>  .../bindings/clock/st,stm32mp25-rcc.yaml      | 160 +++++++++---------
>  .../bindings/clock/xlnx,clocking-wizard.yaml  |   2 +-
>  4 files changed, 152 insertions(+), 152 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


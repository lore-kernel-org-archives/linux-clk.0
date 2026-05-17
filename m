Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A507081F;
	Sun, 17 May 2026 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779018444; cv=none; b=t2O7Xfr4GZ+v0VZKvzh+c3AkcbSYgQU/nbj0PnXU8njyKZEh7Z69izCmIftR5oi7lyOOytHLhkL6ERBI1iS3A8x01z7TEh0KDtZmcRu43qo+SRBIY5WZr+r/pyEqceLvGvyU4nPac2qlyelW0zdqHbIcktCz48/nShDLuaHfd+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779018444; c=relaxed/simple;
	bh=ht5FEAjz4k2i7BzSIOv6urlA4dgzDcKJ4CAWLL1zqco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/CF2YwrfXCPzVX5U6TZ3XAC4khQjtaW53on3BHSxvgfrRH09prY3tKsXdFldtneGPQuf94qcBHpslndtfdx4rfbbezZ/x1+kERqKBaJuwBI1OzJGDGEFx/aSQ0NndQ8DOYwKyt8Z9eGjsfv3bNEN6J+QssceihbkghPsttDgCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRe3v+WL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRe3v+WL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375A2C2BCB0;
	Sun, 17 May 2026 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779018443;
	bh=ht5FEAjz4k2i7BzSIOv6urlA4dgzDcKJ4CAWLL1zqco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gRe3v+WLe6F9aJ8bdwGCpNjVIn4iRqqqurvdZCzGa9ttouCfzl17UX2AlK5ciUSi9
	 PV/PJ+nMftnyPjAlBl53vJqbP46KRAffvhsbh4penXyu9rVZ6F4/GZOx7LolloMB8Z
	 /cGfUCrQDTTUyshS8d7m6SXu+qH/DH2FebHMWf2J4LKOmfiD/N5kxR5+WeKpZ0//ig
	 TtXyvUwlx9n4y113r03qIIhSAJxoKGWAVeV0NL8Gw3xY4hRmyC25/Tsw1+7EV7lsf7
	 I//v3E6nN+5ueJvl+mD5Lj+SRhLZ/CfVCwrN5iReKhelr4anYqzPqvkwIaJSz8SYlu
	 6Tstx7CjpjNSg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	cristian.marussi@arm.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: scpi: pass child node to of_clk_del_provider() in remove
Date: Sun, 17 May 2026 12:47:17 +0100
Message-ID: <177901833722.3838478.12838195282594150.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513090900.5323-1-sozdayvek@gmail.com>
References: <20260513090900.5323-1-sozdayvek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 13 May 2026 14:09:00 +0500, Stepan Ionichev wrote:
> scpi_clocks_remove() iterates over the SCPI clock provider's child
> device nodes, but passes the parent node to of_clk_del_provider()
> on every iteration:
> 
> 	for_each_available_child_of_node(np, child)
> 		of_clk_del_provider(np);
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] clk: scpi: pass child node to of_clk_del_provider() in remove
      https://git.kernel.org/sudeep.holla/c/b79d9b5747d9
--
Regards,
Sudeep


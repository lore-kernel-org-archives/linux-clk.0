Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40953AA4E0;
	Wed, 13 May 2026 05:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651330; cv=none; b=DJfIudmO/1/W/yGI4hocTO1bgYwupqC7A+slweOdyEXXV5L7LyBMHjXgexT1y6IFGzYfNNYM/9E0qQR6i4YQU4V27hSYpMPbH8hwymc5XJDfj8l69WvXrT0ZnmfOaqk/+6S9uCJhqJuIirtHdYZ/aPqkb+Mx7aZ5Paq7TZ+aLWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651330; c=relaxed/simple;
	bh=I7p1QW77nQCPFuXQb/fNZcylqWd9fGF/OuO0E0wCq/4=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=YO7VN5hjk2I4oF35NDWVkOIeh7/pDtclZSjUkLjQ4uLQ3byv7dogY2/WHhmD2Dw7OqPmFj4eCAJG/XA294J4q6T7CxfxSxRqTmiaAEYb8OeF+jh5D2HUYr8d99Ek2H1rU0rAwEg9XZuNluLXCVFEGj7vkdWaqx/zcIToZMVKVDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNvVNiZ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNvVNiZ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567A9C2BCB7;
	Wed, 13 May 2026 05:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778651329;
	bh=I7p1QW77nQCPFuXQb/fNZcylqWd9fGF/OuO0E0wCq/4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=aNvVNiZ3GWScEtnq8fEsJeClnQ87lfql5ovgiiy8XE7ChAik6iUzHQzWdRm5EWmRF
	 mf60OjL6Lw6A7f2fSBMXcHrK+UwbU36yF9D2pAbKEAZ+L53GPK3pyIARNxNmg5LMGU
	 3vMCV4lTcnzo3PGRyF6c7sn3TcoTObBage7hmKRrWGwAMQZd40eZoiJkKBezuc+jN8
	 jZ6l4bIOIU4pqNhEH7D+m0Eudduysw4SN5IbVxEl+DhRh1/qty1R/Qi1A5HM9dr/GW
	 2JN4uo1NeAlPNUAOE03RGRN2TmTJAxA5+hvQbA18Vz4lBOwXKea+NrMolF4PjKg01P
	 IsrTgk412d87w==
Message-ID: <acf2582a140de198d389a9dfdd7bd862@kernel.org>
Date: Wed, 13 May 2026 05:48:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH v3 3/4] docs: clk: include some identifiers to keep
 documentation up to date
In-Reply-To: <20260511-clk-docs-v3-3-ed67e1065809@redhat.com>
References: <20260511-clk-docs-v3-3-ed67e1065809@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Jonathan
 Corbet" <corbet@lwn.net>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Shuah Khan" <skhan@linuxfoundation.org>, "Stephen
 Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

On Mon, 11 May 2026 21:35:06 -0400, Brian Masney wrote:
> The clk documentation currently has a separate list of some members of
> struct clk_core and struct clk_ops. Now that all of these structures
> have proper kernel docs, let's go ahead and just include them here via
> the identifiers statement in kerneldoc.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

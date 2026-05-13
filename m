Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E705A3AB28E;
	Wed, 13 May 2026 05:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651313; cv=none; b=RV2V54y39dWDjN9HrJELUY8gJ+PEeiOiD4GcnUYFIG4+lqHnUK82q5PlCAks5jRgGTHIjjlqcqSv2x9sjx/eqDCzW8ZC8D6WNkE5VZi/gnMOQnThPhm/j4ipo8PYtJ28YU5rrOIyhQVrwWhMhyKO/KCw0Om9M3ymStuR67l983k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651313; c=relaxed/simple;
	bh=fjLWiGx+M6oKtkxBeeS9JuwhUslkZrpWiPhiXiSODuU=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=qj8oJDhYszWiJH6LokE7XZgBJJ5WFjEb1voJve1BnE4Ukt7Q3Mrsr3iMCXXwVzLwT88LNj+1WybJOwBIru7dy3RDt/siRd+aKGg/4WOoMIVm35OobL1kKK9wJ+tlxOn+1ZZpjVE1TIKZzM4Z/N3CGAkpkVbRrYU9Ceaj2IkFun4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NipYu/iI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NipYu/iI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36068C2BCB7;
	Wed, 13 May 2026 05:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778651311;
	bh=fjLWiGx+M6oKtkxBeeS9JuwhUslkZrpWiPhiXiSODuU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=NipYu/iI6IvnMXjvYnAQTERDN+tjwF/nCK0EgWQKwypxPgSuyzM0042jG+bm0vzQT
	 blfwP0KcHsOUIrDy3hRzRFNswrU6u+UGoNsKTQV2inbg5IdLYQlP8NEqLfpaRNnyqB
	 w9kMRMLDr9cgVMicM2MllzmK4RRJseyVJMR2zvQaqIxLisz3XZklE0iiBgNgSGbLdL
	 Uq1RzVIRUHf+6wGyTDNUGLGMxugORm2F4nKy5VXeqrM+NBF0VgSHOlPiX8h0uEQyaY
	 cycERHoqUZL3wlancXYTfD0Ohz9LF18zVIYK63D4iZ8Cu4NSNpIlTI3USrc5Rl5sqB
	 nYi8X671KEOEw==
Message-ID: <c885d12e733d3b27172121797903a4e4@kernel.org>
Date: Wed, 13 May 2026 05:48:28 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH v3 2/4] clk: add kernel docs for struct clk_core
In-Reply-To: <20260511-clk-docs-v3-2-ed67e1065809@redhat.com>
References: <20260511-clk-docs-v3-2-ed67e1065809@redhat.com>
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

On Mon, 11 May 2026 21:35:05 -0400, Brian Masney wrote:
> Document all of the members of struct clk_core.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

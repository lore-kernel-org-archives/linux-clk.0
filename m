Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645269;
	b=gckIc4NXsYW7amEJubu2SndbXehwsnn+mvmlQci+XKqirKm4kwts3f7EVZO1xOWeLlh6
	 1gKtZY1nzfaqV/Gwibt1XkNDbDTObw3vuff+3mT18RvjkPF00tSFLtwj4W4dcTbNrDYyt
	 JEDfFA03w6WKtb7S4WScEQ2N/0SLu2bfg+KfcZ/rrWod2Cx+mSaaT9K2CxTFgKxIaq95/
	 R6lYE4XzCd0rI7N5XVH0IplROZShKDu1CsFSD7/Mj7AftqwnL7qYmz52a8TF0wXt3pXoM
	 AYwyGV8EpxBOm09y2jvhBx0m2kzdJXkZwlhUL5TO6uV7IinVkf6J+o10sQG1Ejl+F+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645269;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition:User-Agent;
	bh=Hg7h0YYkbpY2e5VVX2BjFZzF5nJ2a4W2mksC+MFtT2E=;
	b=ujhOEkxeMx6gnEFFTE/8x/mX99Nrq+pwZ9UZQ6dWyZdcje0bMA4/s5/oDuujR+1b6Pfv
	 RlN26hrMbTeAw/yV7ptosT5tKgpZUbLIxOZCLTv/dz//A+oErdJXSOrAoMW2yLcqVzQV/
	 Z1y8pDxIndP6UcPcdCZ0fB0/08UKVS18szt4hf4dgJFpB02YBqYp2NlaM1BmPyh+h+aEx
	 RADhsryfjCMw+ZP8qaLuxdQ6teo+HMeJxHuEwLfCF28hdGUswyuq1bNnWGE0lYAm0pYu7
	 XsOA+NDOMV0y0lVfZ2fYVYEG60rioa8i9Eowmb980zauuiXxuelLVtv8imeqPs3q9Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aeIWbTYr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D18C606A323
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 22:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aeIWbTYr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467BD1F000C6;
	Wed, 25 Nov 2026 22:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645268;
	bh=Hg7h0YYkbpY2e5VVX2BjFZzF5nJ2a4W2mksC+MFtT2E=;
	h=Date:From:To:Subject;
	b=aeIWbTYr/oM55DwOveNnIaTfJh63qJUUyY+Lqzy//OuMSAg7T39DjyubPzW3Ov/kW
	 sOaQWb/mZAcpu3qstaTE7aXUCk7UdDzTr25+p/5j1aYiNQl57WXWWtwo8BgrjTTZQS
	 Bo7u4/ZZNXlYpphXzthJnVtDj+rXvanYZOAG10uY+vO8hwv+M3pEVur3+fJYtMxno9
	 hXYRKk6p4ae/TpovPYxG7ofNnt7PROmOc93gEysbD2FiPPTJyEfMz4s9jMR4K+q1Oy
	 3JL9StihCiLi3EvdRmdJMENomxPy3GGowZtTxU8uCU735IPvH678+l9KFnMUDR8/ox
	 IyUmkL4LMWFCQ==
Date: Wed, 25 Nov 2026 17:21:07 -0500
From: Brian Masney <masneyb@kernel.org>
To: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Review prompts for Common Clk Framework (CCF)
Message-ID: <awdfU7Hx2AI_bD3H@x1g10>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi all,

I fed over 11k review messages from the linux-clk mailinglist into
Claude, and had it summarize common review issues that were encountered,
and put it a markdown file suitable for Chris Mason's kernel review
prompts repo. What I currently have is at:

https://github.com/masneyb/review-prompts/commit/a58ec112c6a467a9b8cdde13f7e9bd25d72c5fdf

This will make it so that Sashiko can flag these issues when new patches
are posted.

I'm planning to submit a merge request sometime early next week. If you
have time, please take a look and let me know if you have any suggestions
for improvement.

Thanks,
Brian


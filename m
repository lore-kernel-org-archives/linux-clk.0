Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793425307;
	b=Hvz0iO/2TuVov5EmQkbweeFzmqcygXz6fXyBYeF55GBZgvzfd5sP7hoIvx7jUpJhUTBl
	 Id78xaY3TQ5lNds9dvo2gKdLKfIK13zVpJ1X9jtFST7hTFMhVz/EfFZFIGi0A8UgptqEs
	 gEQBze61TTBq9L0Zqjgv4YSk1nLFfmbjNjIzHLMsBEwTHsxYNpSTQXAEvtza6ZySd6eip
	 TiIYpOAYgNmrH/ml5sF8xbykPtSn6LltXjp4u0hKcboqzoIaH1tTlUMbK4XZjMPy9TEL7
	 jUqe7UGVnTMe4566WWYSWE9KW0SRfvX6AEBXtVDsm8ZzMrWPfMBmlSw3IEn19qyWcwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793425307;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:Message-ID:
	 References:X-Pmail-ID:From:To:Cc:Subject:Content-Transfer-Encoding:
	 Date:MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=jI8T5c3f3LqNpG25TWB8fWvMcJXinVSA9ZWa73qQlCQ=;
	b=WVvmMWY3U6NauKqfBhcR18bx33ia2Pp+xGr5xsJPoglnH5aISWOkJW/y54cn0yHxP0cO
	 LvBxy6Q5wZtkERJxWrfQ7wDEkudIqMqnYxI4h9rpEAu8vsFUG0VHxkWIU1rTJMI0FVaVB
	 KimS326/ZCQxYpL9qSfRjoL1aQmcRbUrxwunN00g39X8AoecpiWTwsuXx94qwEUfNCUSa
	 +BBd8kRMT1HrWeIE+qUUGOHE4SXYGcC11La5KG8seZXrbvTLqeoYp+3zmp4FHjN8Z6M16
	 I0SdnjmapMrZtGR+rzI4KaOd25/lhgvsHj2xoiBjPSVFmxlP4Ee2Nu45NJNSGbs30vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=brar.si;
	spf=pass smtp.mailfrom=rsend.brar.si;
	dkim=pass header.d=brar.si header.i=@brar.si header.a=rsa-sha256 header.s=resend header.b=Ka+af0qI;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=CfDXVVxL;
	arc=none smtp.remote-ip=23.251.234.53
Received: from e234-53.smtp-out.ap-northeast-1.amazonses.com (e234-53.smtp-out.ap-northeast-1.amazonses.com [23.251.234.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41C4606A31A;
	Sat, 31 Oct 2026 05:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B41C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=brar.si
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsend.brar.si
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=brar.si header.i=@brar.si header.a=rsa-sha256 header.s=resend header.b=Ka+af0qI;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=CfDXVVxL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=brar.si; t=1793425305;
	h=In-Reply-To:Message-ID:References:From:To:Cc:Subject:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=FEQXhvLhTuGrd5NaJDpvvxJxaBTVbUfxPfAcURqm+dE=;
	b=Ka+af0qIkhPtHxtN3J9YkC4Af5HTcC2Nx1Zp1gHcMcEdCI+u+IQbSl6kJ38XznmX
	EWC9ygq20weTsBwasjy6wa/kH/5B7lMP9ZqS5sBuxm/qlJJGKN90a3VwGM+0Oa1rF1H
	DtCnIHiEsoD0lNLccdBTXnEWenmPpGwLazyvT6tQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1793425305;
	h=In-Reply-To:Message-ID:References:From:To:Cc:Subject:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=FEQXhvLhTuGrd5NaJDpvvxJxaBTVbUfxPfAcURqm+dE=;
	b=CfDXVVxLPGNFVqBzzMnWg8FWowHMxHU4V5nNOYo4y+4OYPoY7Lptv7mrbSZdblId
	IvGnGYAaO0OoiybOFy4UnyaYMtUhny85e2UOkZ/CHKVMX+fJOk2FAN5zvoPL5ajJuxs
	C79TLIWVQIUkKshKY6TSzrAGcJ2DFjMxUZg2OISg=
In-Reply-To:
 <natokcic7hm2l3erd2jhghzlkg4nvy5kejms27hi6dr4xmid5h@tnhinn7yjp3i>
Message-ID: <010601a1907a6e57-6b4897eb-cb32-47c4-8b79-1ad1c73e7613-000000@ap-northeast-1.amazonses.com>
References: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
 <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
 <natokcic7hm2l3erd2jhghzlkg4nvy5kejms27hi6dr4xmid5h@tnhinn7yjp3i>
X-Pmail-ID: <1793425304285.ee9300a6194d@brar.si>
From: Ishu Brar <patches@brar.si>
To: abel.vesa@oss.qualcomm.com
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, taniya.das@oss.qualcomm.com, 
	quic_imrashai@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SM7250 graphics clock controller
 driver
Content-Transfer-Encoding: 7bit
Date: Sat, 31 Oct 2026 05:41:45 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.5YL5VvZ+qZ0e19wo5UdMspzrKjMAjMWs/SlfuwHJq77JVCQWpVGwyETo7FaXf+sztO4bYMxF6WHssrYHSY+K7X2T1EZhOskwm44pQQStdKG0Jdj3d5ybzIXFkMTcPBXllY63oWIrFhJN26LFqLzTuHiXuqj9UCHxIuFhxi7IM0GCfceBHtKocmWdFsR9dK9X:1.ap-northeast-1.TOS0vxEE3Ar6ai29fkp2i/jb+l2iigajCGeLfF7S3sk=:AmazonSES
X-SES-Outgoing: 2026.10.31-23.251.234.53

On Tue, 27 Oct 2026 13:32:54 +0200, Abel Vesa wrote:
>> +static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
>> +	.halt_reg = 0x5000,
>> +	.halt_check = BRANCH_HALT_VOTED,
>
> sm8250 uses BRANCH_VOTED here.

Yes, that is on purpose. BRANCH_VOTED skips the status poll on enable,
while BRANCH_HALT_VOTED still checks that the voted clock came up. The
newer GPU clock controller drivers (SM8350, SM8450, SM8550, SM8650,
SM8750, X1E80100) use BRANCH_HALT_VOTED for this clock. I tested it on
the Nord with the GPU SMMU as a consumer: the clock enables and there
are no "stuck at off" warnings.

Should i match SM8250 or keep BRANCH_HALT_VOTED iin v3?

Ishu Brar

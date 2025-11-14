Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D192264CC;
	Fri, 14 Nov 2025 00:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763079230; cv=none; b=J8iMNbMs0j7XRBpTbRqSw7q7DhhJD+oXvU6WJGEXL0C2NkWquCKURobykIc0Fgfwf7fKNkXJxVLndwm1gOcpI8UbTCKNkMqJ/bXjDpEwTOMjvK+1n9dEP+IXYv4cbhxUJ+E9XXe+oxioqHp6ekbtqwigfclYhCFKx7hN7rbdKTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763079230; c=relaxed/simple;
	bh=gXqtBFBFIfkgGfikveDZ8wq1v53j7atXVXAfFNF4Gog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u56BfoYfu0ibpNO+M3sAxrOgj7DXWOF1Xfh+awJ4YCV/NgDBa80IQzErQNioFCnRG0PZiJe3axRH10FcQKFBb44mKE6GoYUNR/vkWxecaeOSrWGUnk5gMHNlsk6BIYFgYlTkHdy7V4YBmV4LHDbfarIuV5MAUfXAHIyp7I+h7Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2xZPutQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2xZPutQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF58DC19423;
	Fri, 14 Nov 2025 00:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763079229;
	bh=gXqtBFBFIfkgGfikveDZ8wq1v53j7atXVXAfFNF4Gog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k2xZPutQ+8HuwIsAJud5GMhzDz6EDn48UwScwhC5AmRYAclSWkL/eaiVGTONu8exC
	 xglPBFUAh+Ks+uTVNujE7uYDIEtv2gkBXwB2nFy6eoeTmeI1Ifl9ITHXT3KZcIrE+d
	 tF3sBazvbUaHRs3r5GvUP1VW2HHn1jqnnNeDyxQtKDUY9wovfTfYluKIQ6f7pxBUq3
	 OhCgo/+6lRwp65tToBk+gqtr39uXUT4suMTe/Cb1Ph8ILH9jTOR4SnrRmmFA8pvBzA
	 TIFfoWGHYqBDt+O3kdJ+zKIll1sfuNykz3RhwE5BxVftadbXCUUBuBqbYYjA+k9eow
	 HypveHjlOWT+A==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: apss-ipq5424: remove unused 'apss_clk' structure
Date: Thu, 13 Nov 2025 18:18:07 -0600
Message-ID: <176307948650.2565969.5257837735762779607.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251113-ipq5424-remove-apss_clk-v1-1-e942e720cf99@gmail.com>
References: <20251113-ipq5424-remove-apss_clk-v1-1-e942e720cf99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 13 Nov 2025 17:15:25 +0100, Gabor Juhos wrote:
> The locally defined 'apss_clk' structure is not used in the code, so
> remove that.
> 
> Compile tested only.
> 
> 

Applied, thanks!

[1/1] clk: qcom: apss-ipq5424: remove unused 'apss_clk' structure
      commit: dc937f12e6c3488713de1262e37a30307ee9feac

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5476C2EC090;
	Sat, 11 Apr 2026 23:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775949780; cv=none; b=a9G48oDQ/qXXccqtgvQICuLwKcYpA5MzuV1CpbWmc7+iIQ+sHMY8L3/Dsot69nZXqhzFlgQIcZaZHfUNIyqgk0ihUbrIO2+2OD3sfXryC5467ZuiJfsRUf9EAJZBToomRdQHxdcIf0tZ9yY1oo6Hz8SRt13zY4CuIsN01uedkIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775949780; c=relaxed/simple;
	bh=oroHxUHClPYUz4m0h5zu5EEP5ijWju07lGzziFBaADw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Gkd26FFrKVpguf8aI5l2A3ecpSxxe0J4RYfS4Q6n5kJIEGvyKN/Yf+7qvQaofgEZvE+6QjcW4rtHTCbFFUYZeITi3NcETEKKM02XMKmd7glLXbaokjdZ9yPD8zXwQrsaSUO9/nevPO2xLXzEYNJslMfrHR8DvVyA/WbHNAO8TE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUF5W2IQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUF5W2IQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C66C116C6;
	Sat, 11 Apr 2026 23:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775949779;
	bh=oroHxUHClPYUz4m0h5zu5EEP5ijWju07lGzziFBaADw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bUF5W2IQppSSBZ++1XBpRjQ+M0iWcqCAalWKya2cuCEqB5mmlSlIerJ9LUyXy8hFA
	 DrdmwfiTSBOteXRYfv+KOhLAh/aYe/s2c8VURHV8ko2In9zgwxLtsp6TJx2mn8vCld
	 RrY8vq27kGvX1CPtUDSi6rnmpzblrpY9ip6w3g+V4y3YnzlJadyfPsvITXu5W7ci/T
	 UIIAmPuilaTAz3EetJqyg62iprt56EKIgEFPQqaVT6pWzXknWKu7b1U9sZde+lXCMt
	 4EJ48vMdA7abpxkJJdg1tX9yXY+0bQ8hid6TCAkEAHLSMY67bKvC/s6YukdJoea+dm
	 z/nWovg5Ucmqg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260326134515.67326-1-andersson@kernel.org>
References: <20260326134515.67326-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock fix for v7.0
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Sat, 11 Apr 2026 16:22:57 -0700
Message-ID: <177594977765.5403.8286169436542730631@lazor>
User-Agent: alot/0.12

Quoting Bjorn Andersson (2026-03-26 06:45:15)
>=20
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-fixes-for-7.0
>=20
> for you to fetch changes up to 141af1be817c42c7f1e1605348d4b1983d319bea:
>=20
>   clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source (2026=
-02-23 10:45:35 -0600)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

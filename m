Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2384627F4F5;
	Wed, 25 Mar 2026 02:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406953; cv=none; b=CZKuU7sVyIghaCMkugCLnrPJed4qmGga1zd9VS7W5ngYi9NrfMN73XRXQ+Vs0gXauL0y+To9V8Dqe/MUZoUkusER8rJqgQCafhxQnCXZyAEItdSeKPddViz4W1WOapZFr4EoXWQJNH9DTj5mOa0lGAYnY2Vfk9ND/QouVigViRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406953; c=relaxed/simple;
	bh=X1OADT/BxMVeIqX4J1KXAyJpp2hI2++oIacNwhPMYjo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=fJx9QJ23LB3Sp3ma+WZjUJQA+G1aglekKfG/CvbVw80+FjOJVDO7P32BJ/q4zmes3MIEM/JI7Qao7WKjuewnub2E0kPemgjV7RsS4py8zFKTJQxFclUgCecB+rrY/NlHCiAfOD8AnEbMYQgB716p8y6pK/hXASVBSbWuo/rqZks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXdvhRdO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXdvhRdO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EC0C2BCB2;
	Wed, 25 Mar 2026 02:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774406952;
	bh=X1OADT/BxMVeIqX4J1KXAyJpp2hI2++oIacNwhPMYjo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nXdvhRdOkxNT3teGIJH65GPHo3sz72HId0dkew5PbCLOhkCRoiwKJS1WfdBAahA6e
	 AKsLCF1PwmQ8rr2rNzfiNioazVvbDRWard31j1dNvMhqAffK8y5dR+wBLxsQeetb10
	 xkXVU6l6XsstvWXQdbK0kdP9HslWIC+BQEk7tFjt5gJdAXQTa/KCK5OQrfit8gyGLd
	 /UqC8P5fRa4Z1DeUNijcGE42s7jci4tDTIzsk9RFGDA2oxE9+YAh0CpcER7mRGzYXl
	 58fxElazSdZGBpOXsAB+e5wZAkpRZtfN2hcvEG8Btx8Ea87GSh9eomn5Ph7dhiDDF4
	 19jsDS/Gte9DQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260303080655.2155-1-dongxuyang@eswincomputing.com>
References: <20260303080513.2042-1-dongxuyang@eswincomputing.com> <20260303080655.2155-1-dongxuyang@eswincomputing.com>
Subject: Re: [PATCH v15 2/4] clk: divider: Add devm_clk_hw_register_divider_parent_data
From: Stephen Boyd <sboyd@kernel.org>
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com, ganboing@gmail.com, marcel@ziswiler.com, Xuyang Dong <dongxuyang@eswincomputing.com>
To: bmasney@redhat.com, conor+dt@kernel.org, devicetree@vger.kernel.org, dongxuyang@eswincomputing.com, krzk+dt@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, robh@kernel.org, troy.mitchell@linux.dev
Date: Tue, 24 Mar 2026 19:12:56 -0700
Message-ID: <177440477648.5403.11962629021420509032@localhost.localdomain>
User-Agent: alot/0.12

Quoting dongxuyang@eswincomputing.com (2026-03-03 00:06:55)
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
>=20
> Add the devres variant of clk_hw_register_divider_parent_data() for
> registering a divider clock with parent clk data instead of parent
> name.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---

Applied to clk-next
